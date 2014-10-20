<script type="text/html" id="vm_list_tpl">
<tr id="ir<%= item_id %>" item="<%= item_id %>" class="itemrow" >

    <td class="numcol">
        &nbsp;<%= item_number %>
    </td>

    <td>
        <%= description %>
        
        <% if (tags.length > 0) { %>
            <br /><span class="tags">Tags: <% print tags.length %>
            d
        <% } %>
        
    </td>
    
    <td>
        <%= value %>
    </td>
    
    <td>
        <img class="editbtn" src="img/cog.png" item="<%= item_id %>" />
    </td>

</tr>
</script>





%> <a href="#" class="taglink" special="abc"><%= $tag['name'] %></a>, <%



<% _.each(tags, function(tag){ <%= tag %> }); %>