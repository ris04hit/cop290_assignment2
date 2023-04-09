from re import search
from bcrypt import hashpw
from random import randint
from smtplib import SMTP
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from base64 import b64encode
from datetime import datetime
from dateutil.relativedelta import relativedelta


def password_strength(password):
    length = len(password)
    if length < 4:
        return -1
    elif length < 8:
        if search('[a-z]', password) and search('[A-Z]', password) \
        and search('[0-9]', password):
            return 0
    else:
        if search('[a-z]', password) and search('[A-Z]', password) \
        and search('[0-9]', password) and search('[^a-zA-Z0-9]', password):
            return 1
    return 0

def hash_pwd(password):
    salt = b'$2b$12$BPgM2TZNwWMnrCl5d5Bjme'
    hashed_password = hashpw(password.encode('utf-8'), salt)
    return hashed_password.decode('utf-8')

def gen_otp():
    otp=randint(100000,999999)
    return str(otp)

def mail( user_email, subject, msg ):
    mailll = str('synergyteam.dram@gmail.com')
    passss = str('yigympugyhpzznms')
    emaill = str(user_email)
    body = MIMEText(str(msg))
    SUBJECT = subject
    msg = MIMEMultipart('alternative')
    msg['Subject'] = SUBJECT
    msg['From'] = "Synergy"
    msg['To'] = emaill
    msg.attach(body)
    s = SMTP(str('smtp.gmail.com'),587)
    s.starttls()
    s.login(mailll, passss)
    s.sendmail(mailll,[emaill], msg.as_string())
    s.quit()

def sql_to_list(data, key):
    key_list = []
    for entry in data:
        key_list.append(entry[key])
    return key_list

def feed(cur, user):
    tag_list = user['tag_list']
    query = 'SELECT * from {}'.format(tag_list)
    cur.execute(query)
    tag_list = cur.fetchall()
    if not tag_list:
        query = 'SELECT id_uniq from Tag'
        cur.execute(query)
        tag_list = cur.fetchall()
    tag_list = sql_to_list(tag_list,'id_uniq')
    post_dic = {}
    for tag_id in tag_list:
        query = "SELECT * from {}".format(tag_id+"_pos")
        cur.execute(query)
        post_list = cur.fetchall()
        post_list = sql_to_list(post_list, 'id_uniq')
        for post_id in post_list:
            if post_id in post_dic:
                post_dic[post_id]+=1
            else:
                post_dic[post_id] = 1
    num = 50    # number of posts in feed
    post_list_specific = sorted(post_dic, key=post_dic.get, reverse=True)
    count = 0
    feed = []   # stores (post_id, upvotes_count, already_upvoted, time_str, author_username,title, content, time, already_follow)
    for post_id in post_list_specific:
        if count == num:
            break
        query = "SELECT * from Post WHERE BINARY id_uniq = %s"
        cur.execute(query, (post_id,))
        post_data = cur.fetchall()[0]
        if post_data['public_post'] and post_data['visibility']:
            count += 1
            upvote_table = post_data['upvotes']
            query = "SELECT count(id_uniq) from {}".format(upvote_table)
            cur.execute(query)
            upvotes_count = cur.fetchall()[0]['count(id_uniq)']
            query = "SELECT * from {} WHERE BINARY id_uniq = %s".format(upvote_table)
            cur.execute(query, (user['id_uniq'],))
            already_upvoted = bool(cur.fetchall())
            time = relativedelta(datetime.now(),post_data['creation_time'])
            if time.years:
                time_str = "{} year{}".format(time.years, "" if time.years==1 else "s")
            elif time.months:
                time_str = "{} month{}".format(time.months,  "" if time.months==1 else "s")
            elif time.days:
                time_str = "{} day{}".format(time.days,  "" if time.days==1 else "s")
            elif time.hours:
                time_str = "{} hour{}".format(time.hours,  "" if time.hours==1 else "s")
            elif time.minutes:
                time_str = "{} minute{}".format(time.minutes,  "" if time.minutes==1 else "s")
            else:
                time_str = "{} second{}".format(time.seconds,  "" if time.seconds==1 else "s")
            time = datetime.now() - post_data['creation_time']
            author_id = post_data['author_uniq']
            query = "SELECT username from Account WHERE BINARY id_uniq = %s"
            cur.execute(query, (author_id,))
            author_username = cur.fetchall()[0]['username']
            title = post_data['title']
            content = post_data['content']
            query = "SELECT * from {} WHERE BINARY id_uniq = %s".format(post_data['author_uniq']+"_ers")
            cur.execute(query, (user["id_uniq"],))
            already_follow = bool(cur.fetchall())
            feed.append((post_id, upvotes_count, int(already_upvoted), time_str, author_username, title, content, time, int(already_follow)))
    return feed

def check_username(username):
    if username:
        for i in username:
            if not (i.isalnum() or i=='_'):
                return False
        return True
    return False

def unique_username(cur, username):
    '''Return False if username already exists'''
    query = "SELECT username from Account WHERE BINARY username = %s"
    cur.execute(query, (username,))
    return not bool(cur.fetchall())

def id_gen(cur, id_obj, username, table):
    encoded_username = username[:9]
    if len(encoded_username)!=9:
        encoded_username = "x"*(9-len(encoded_username))+encoded_username
    query = "SELECT id_uniq FROM {} WHERE BINARY id_uniq LIKE '{}{}%' ORDER BY creation_time DESC LIMIT 1".format(table, id_obj, encoded_username)
    cur.execute(query)
    data = cur.fetchall()
    if data:
        id_uniq = data[0]['id_uniq']
        num = str(int(id_uniq[10:])+1).zfill(10)
    else:
        num = "0000000000"
    return id_obj+encoded_username+num

def create_linked_table(cur, id_uniq, suffix, ins_obj):
    if len(ins_obj)==1:
        query = "CREATE TABLE {} ( id_obj ENUM(%s) DEFAULT %s NOT NULL, id_uniq VARCHAR(200) NOT NULL UNIQUE, PRIMARY KEY (id_obj, id_uniq) )".format(id_uniq+suffix)
        cur.execute(query, (ins_obj,ins_obj))
    else:
        lst = list(ins_obj)
        obj_list = []
        for elem in lst:
            obj_list.append("'"+elem+"'")
        query = "CREATE TABLE {} (id_obj ENUM({}) NOT NULL, id_uniq VARCHAR(200) NOT NULL UNIQUE, PRIMARY KEY (id_obj, id_uniq))".format(id_uniq+suffix, ", ".join(obj_list))
        cur.execute(query)
