<%
    ui.decorateWith("appui", "standardEmrPage")
%>

<style>
    #section-details .links a { display: block; line-height: 2em; }
    #section-details .links a:before { content: '- '; }
    #sections .menu-item { size: 0.75em; height: 2em; }
</style>

<script type="text/javascript">

    jq(document).ready(function(){
        // set up clicks in the sidebar menu
        jq("#sections .menu-item").click(function(){
            jq("#sections .menu-item").removeClass("selected");
            jq(this).addClass("selected");
            var sectionKey = jq(this).attr("data-sectionKey");
            jq("#section-details").html(jq("[data-sectionKey=" + sectionKey + "].content").html());
        });

        // start with the top-most section
        jq("#sections .menu-item").first().click();
    });

</script>

<h2>${ ui.message("adminapp.title") }</h2>

<p class="spaced">
    Select a category or module name to see all available administration links and settings.
</p>

<ul id="sections" class="left-menu">
    <li class="menu-item" data-sectionKey="general">
        <span class="title">General Settings</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
    <li class="menu-item" data-sectionKey="users">
        <span class="title">Users</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
    <li class="menu-item" data-sectionKey="patients">
        <span class="title">Patients</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>

    <% modules.each{ %>
    <li class="menu-item" data-sectionKey="${ it.moduleId.replace('.','') }">
        <span class="title">${ ui.message(it.title) }</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
    <% } %>

</ul>

<div id="section-details" class="main-content">
</div>

<% ['general': 'General Settings',
        'users': 'Users',
        'patients': 'Patients'].each{ %>

<div class="hidden content" data-sectionKey="${ it.key }">
    <h4>${ it.value }</h4>
    <div class="links">
        <a href="#">${ it.value } Link One</a>
        <a href="#">${ it.value } Link Two</a>
        <a href="#">${ it.value } Link Three</a>
        <a href="#">${ it.value } Link Four</a>
        <a href="#">${ it.value } Link Five</a>
    </div>
</div>

<% } %>

<% modules.each{ %>

<div class="hidden content" data-sectionKey="${ it.moduleId.replace('.','') }">
    <h4>${ ui.message(it.title) }</h4>
    <div class="links">
        <% it.links.each{ %>
        <a class="target" href="${ it.key }">${ ui.message(it.value) }</a>
        <% } %>
    </div>
</div>

<% } %>

