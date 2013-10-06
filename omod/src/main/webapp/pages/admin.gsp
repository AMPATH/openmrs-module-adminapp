<%
    ui.decorateWith("appui", "standardEmrPage")
%>

<script type="text/javascript">
    breadcrumbs.push({
        label: "${ui.message("adminapp.title")}" ,
        link:'${ui.pageLink("adminapp", "adminapp/admin")}'
    });

    jq(".collapse").collapse();
</script>

<h2>${ ui.message("adminapp.title") }</h2>

<ul id="sections" class="left-menu">
    <li class="menu-item">
        <span> Test 1</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
    <li class="menu-item selected">
        <span> Test 2</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
    <li class="menu-item">
        <span> Test 3</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
    </li>
</ul>

<div id="section-details" class="main-content">
    <h4>${ ui.message('adminapp.settings') }</h4>
    <p class="spaced">Information!</p>
</div>
