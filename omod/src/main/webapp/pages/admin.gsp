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

<div style="float:right; width:15em;">
    <form><input id="search" type="text" placeholder="Search"/></form>
</div>

<h2 style="clear: none">${ ui.message("adminapp.title") }</h2>

<p class="spaced">
    Select a category or module name to see all available administration links and settings.
</p>

<ul id="sections" class="left-menu">
    <% sections.each { section -> %>
    <li class="menu-item" data-sectionKey="${ section.key.replace('.','') }">
        <span class="title">${ section.value }</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
        <span class="hidden content" data-sectionKey="${ section.key.replace('.','') }">
            <h4>${ ui.message(section.value) }</h4>
            <span class="links">
                ${ ui.includeFragment("adminapp", "section", [ app: section.key ])}
            </span>
        </span>
    </li>
    <% } %>

    <% modules.each{ %>
    <li class="menu-item" data-sectionKey="${ it.moduleId.replace('.','') }">
        <span class="title">${ ui.message(it.title) }</span>
        <span class="arrow-border"></span>
        <span class="arrow"></span>
        <span class="hidden content" data-sectionKey="${ it.moduleId.replace('.','') }">
            <h4>${ ui.message(it.title) }</h4>
            <span class="links">
                <% it.links.each{ %>
                <a class="target" href="${ it.key }">${ ui.message(it.value) }</a>
                <% } %>
            </span>
        </span>
    </li>
    <% } %>

</ul>

<div id="section-details" class="main-content">
</div>


