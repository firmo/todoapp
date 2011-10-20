module ListsHelper
  def add_item_link(name, form_builder)
    link_to_function name do |page|
      form_builder.fields_for :items, Item.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => "item", :locals => { :item_form => f })
        page << "$('items').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end

  def remove_item_link(form_builder)
    if(form_builder.object.new_record?)
      # If the item is a new record, we can just remove the div from the dom
      link_to_function("remove", "$(this).up('.item').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
          link_to_function("remove", "$(this).up('.item').hide(); $(this).previous().value = '1'")
    end
  end

  def watch_button(list, user)
    user_list = UserList.where(:user_id => user.id, :list_id => list.id).first
    if (user_list.nil?)
      link_to t("watch"), { :controller => "user_lists", :action => "create", :list_id => list.id, :user_list => { :user_id => current_user.id, :list_id => list.id } }, :method => :post, :class => "watch_button"
    else
      link_to t("unwatch"), { :controller => "user_lists", :action => "destroy", :list_id => list.id, :id => user_list.id }, :method => :delete, :class => "unwatch_button"
    end
  end
end
