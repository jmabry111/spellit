defmodule Spellit.FormView do
  use Spellit.Web, :view
  
  def auto_submit_selectize(form, field_name, collection, opts \\ []) do
    select(
      form,
      field_name,
      collection,
      opts ++ default_autosubmit_selectize_options
    )
  end
  
  defp default_autosubmit_selectize_options do
    [
      prompt: "Click here to select",
      data: [
        selectize: "single",
        autosubmit: "true",
      ],
    ]
  end
end
