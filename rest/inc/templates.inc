<script type="text/html" id="vm_list_tpl">
    <td class="numcol">
        &nbsp;{{item_number}}
    </td>

    <td class="hobo">
        {{description}}
        
        {{#has_tags}}
            <br /><span class="tags">Tags:
            {{#tags}}
                <a href="#" class="taglink" special="abc">{{.}}</a>,
            {{/tags}}
        {{/has_tags}}
            
    </td>
    
    <td>
        {{value}}
    </td>
    
    <td>
        <img class="editbtn" src="img/cog.png" item="{{item_id}}" />
    </td>

</script>