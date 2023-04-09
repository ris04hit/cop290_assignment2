class Header extends HTMLElement {
    constructor() {
      super();
    }

    connectedCallback() {
        this.innerHTML = `
            <header>
                <rect id="rect_header"></rect>

                <div id = "not_show_signup">
                    <a href="{{url_for('home', username=username)}}">
                        <rect id = "rect_home"></rect>
                        <div id = "home">Home</div><br>
                    </a>
                
                    <a href="{{url_for('about')}}">
                        <rect id = "rect_about"></rect>
                        <div id = "about">About</div><br>
                    </a>
                
                    <a href="{{url_for('apis')}}">
                        <rect id = "rect_apis"></rect>
                        <div id = "apis">APIs</div><br>
                    </a>
                
                    <rect id = "profile_rect"></rect>
                    <a href="{{url_for('profile', username = username)}}">
                        <rect id = "profile_photo"></rect>
                        <div id = "profile_name">{{username}}</div><br>
                    </a>
                    
                    <form><input id = "rect_search" placeholder="Search People, Institutions"></input></form>
                    <rect id = "circle_out_search"></rect>
                    <rect id = "circle_in_search"></rect>
                    <rect id = "line_search"></rect>
                </div>
                
                <a href="{{url_for('loader3')}}">
                    <img src = "{{url_for('static',filename='/data/logo.jpg')}}" id = "logo"></img>
                </a>

            </header>
            `
  }
}
  
  customElements.define('header-component', Header);