<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("adminapp", "jquery.highlightingsearch.min.js")
%>

<style>
    #sections .menu-item { size: 0.75em; height: 2em; }
    .match, a.button.match { background: yellow; }
</style>

<script type="text/javascript">

    jq(document).ready(function(){
        // set up clicks in the sidebar menu
        jq("#sections .menu-item").click(function(){
            jq("#sections .menu-item").removeClass("selected");
            jq(this).addClass("selected");
            var sectionKey = jq(this).attr("data-sectionKey");
            jq("#section-details").html(jq("[data-sectionKey=" + sectionKey + "].content").html());
            if (this != jq("#sections .menu-item").first()) {
                jq('html, body').animate({
                    scrollTop: jq("#section-details").offset().top
                }, 1000);
            }
        });

        // start with the top-most section
        jq("#sections .menu-item").first().click();

        // add highlighting functionality
        jq('#search').highlightingsearch({
            targetClass: '.menu-item .title,.links a',
            highlightClass: 'match',
            callback: function(elem, highlightClass) {
                if (elem.prop('tagName') == 'A') {
                    var section = elem.parent().parent().attr('data-sectionkey');
                    jq('#sections li[data-sectionkey="'+section+'"] span.title').each(function() {
                        jq(this).addClass(highlightClass);
                    });
//                    jq('#sections li[data-sectionkey="'+section+'"]').addClass(highlightClass);
                }
            }
        }).focus();
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
        <span class="title">${ ui.message(section.value) }</span>
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
                <a class="button app big" href="/${ ui.contextPath() }/${ it.key }">
                    <i class="icon-link"></i>
                    ${ ui.message(it.value) }
                </a>
                <% } %>
            </span>
        </span>
    </li>
    <% } %>

</ul>

<div id="section-details" class="main-content">
</div>


