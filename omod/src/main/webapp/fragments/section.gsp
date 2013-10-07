<% links.each{ %>
    <a class="button app big" href="/${ ui.contextPath() }/${ it.url }">
        <i class="${ it.icon }"></i>
        ${ ui.message(it.label) }
    </a>
<% } %>