class <%= controller_class_name %>Datatable < BaseDatatable

  def initialize(view)
    @model = <%= class_name %>
    super(view)
  end

  private

    def data
      items.map do |item|
        [
<% for attribute in attributes -%>
            item.<%= attribute.name %>,
<% end -%>
            all_actions(item, item.<%= attributes[0].name %>)
        ]
      end
    end

    def sort_column
      columns = %w[<% for attribute in attributes %> "<%= attribute.name %>"<% end %>]
      columns[params[:iSortCol_0].to_i]
    end
end
