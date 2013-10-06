<%
    ui.decorateWith("appui", "standardEmrPage")
%>

<script type="text/javascript">

    jq(document).ready(function(){
        // set up clicks in the sidebar menu
        jq("#sections .menu-item").click(function(){
            jq("#sections .menu-item").removeClass("selected");
            jq(this).addClass("selected");
            jq.ajax({
                url: "${ ui.pageLink("adminapp", "section") }",
                data: {
                    section: jq(this).attr("data-sectionKey"),
                    title: jq(this).find(".title").html()
                },
                success: function(data) {
                    jq("#section-details").html(data);
                }
            });
        });
    });

</script>

<h2>${ ui.message("adminapp.title") }</h2>

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
    <li class="menu-item" data-sectionKey="patient">
        <span class="title">Patients</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
</ul>

<div id="section-details" class="main-content">
    <h4>${ ui.message('adminapp.settings') }</h4>
    <p class="spaced">Information!</p>
</div>
