<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("adminapp", "jquery.highlightingsearch.min.js")
%>

<style>
    .sections .menu-item { font-size: 0.75em; height: auto; }
    .menu-item.match, a.button.match { background: yellow !important; }
    .match:hover, a.button.match:hover { background: gold !important; transition: background-color 0.5s ease; }
    ul.left-menu li { width: 152px; min-height: 0; padding: 7px 10px; }
</style>

<script type="text/javascript">

    jq(document).ready(function(){

        // set up clicks in the sidebar menu
        jq(".sections .menu-item").click(function(){
            jq(".sections .menu-item").removeClass("selected");
            jq(this).addClass("selected");
            var sectionKey = jq(this).attr("data-sectionKey");
            jq(".section-details").html(jq("[data-sectionKey=" + sectionKey + "].content").html());
            jq('html, body').animate({
                scrollTop: jq("body").offset().top
            }, 1000);
        });

        // add click event to tabs
        jq(".tabs .ui-tabs-anchor").click(function(){
           jq(this).find(".menu-item:first").click();
        });

        // start with the top-most section
        jq("#system").click();

        // add highlighting functionality
        jq('.search').highlightingsearch({
            targets: [
                {each:'.menu-item', text:function(elem) { return elem.find('span.title').text(); }},
                {each:'.links a', text:function(elem) { return elem.text(); }}
            ],
            highlightClass: 'match',
            callback: function(elem, highlightClass) {
                if (elem.prop('tagName') == 'A') {
                    var section = elem.parent().parent().attr('data-sectionkey');
                    jq('li[data-sectionkey="'+section+'"]').each(function() {
                        jq(this).addClass(highlightClass);
                    })
                }
            }
        }).focus();

        // tabify
        jq('.tabs').tabs();
    });

</script>

<div style="float:right; width:15em;">
    <form><input id="search" type="text" placeholder="Search"/></form>
</div>

<h2 style="clear: none">${ ui.message("adminapp.title") }</h2>

<p class="spaced">
    Select a category or module name to see all available administration links and settings.
</p>

<div class="tabs" xmlns="http://www.w3.org/1999/html">
    <div class="container">

        <ul>
            <li>
                <a href="#system">
                    System
                </a>
            </li>
            <li>
                <a href="#modules">
                    Modules
                </a>
            </li>
        </ul>

        <div id="system">
            <ul class="left-menu sections">
                <% sections.each { section -> %>
                <li class="menu-item" data-sectionKey="${ section.key.replace('.','') }">
                    <span class="title">${ ui.message(section.value) }</span>
                    <span class="hidden content" data-sectionKey="${ section.key.replace('.','') }">
                        <h4>${ ui.message(section.value) }</h4>
                        <span class="links">
                            ${ ui.includeFragment("adminapp", "section", [ app: section.key ])}
                        </span>
                    </span>
                </li>
                <% } %>
            </ul>

            <div class="section-details main-content">
            </div>
        </div>

        <div id="modules">
            <ul class="left-menu sections">
                <% modules.each{ %>
                <li class="menu-item" data-sectionKey="${ it.moduleId.replace('.','') }">
                    <span class="title">${ ui.message(it.title) }</span>
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

            <div class="section-details main-content">
            </div>
        </div>

    </div>
</div>



