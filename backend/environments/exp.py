import unittest
from app import app


print("HI ")
class TestAPI(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
    # print("Hello")
    def test_valid_login(self):
        # print("dl")
        response = self.app.post('/login', data=dict(inp_start1='wernertheresa', inp_start2='Ccvxg@4'))
        # print("ML")
        self.assertEqual(response.status_code, 302) # Successful redirect
        
    def test_invalid_username(self):
        response = self.app.post('/login', data=dict(inp_start1='invalid_username', inp_start2='valid_password'))
        self.assertEqual(response.status_code, 200) # Bad Request
        
    def test_invalid_password(self):
        response = self.app.post('/login', data=dict(inp_start1='wernertheresa', inp_start2='invalid_password'))
        self.assertEqual(response.status_code, 200) # Bad Request
    
    def test_create_account_success(self):
        data = {
            'username_signup': 'testuser',
                'email_signup': 'devanggarg20003@gmail.com',
                'otp_signup': '',
                'password_signup': '',
                'confirm_signup': '',
                'country_signup': '',
                'state_signup': '',
                'city_signup': '',
                'web_signup': '',
                'git_signup': '',
                'org_signup': '',
                'image_profile_signup': '',
                'name_signup': '',
                'send_button_signup': 'send_otp_signup'
        }
        response = self.app.post('/signup', data=data)
        print("For otp_send: ",response.status_code)
        self.assertEqual(response.status_code, 200)
        print("good")
        # print(response.data)
        self.assertIn(b"Enter OTP", response.data)
        # print("Okay ")
        data = {
            'username_signup': 'testuser',
                'email_signup': 'devanggarg20003@gmail.com',
                'otp_signup': '123456',
                'password_signup': 'Test@31234',
                'confirm_signup': 'Test@31234',
                'country_signup': 'testcountry',
                'state_signup': 'teststate',
                'city_signup': 'testcity',
                'web_signup': 'testweb',
                'git_signup': 'testgit',
                'org_signup': 'testorg',
                'image_profile_signup': 'testimage',
                'name_signup': 'testname',
            'send_button_signup': 'create_account_signup'
        }

        
        response = self.app.post('/signup', data=data)
        # print(response)
        self.assertEqual(response.status_code, 302)
        # print(response.headers['Location'])
        self.assertEqual(response.headers['Location'], '/')

        def test_valid_login(self):
            # print("dl")
            response = self.app.post('/login/otp', data=dict(inp_start1='wernertheresa', inp_start2='Ccvxg@4'))
            # print("ML")
            self.assertEqual(response.status_code, 302) # Successful redirect



if __name__ == '__main__':
    unittest.main()
