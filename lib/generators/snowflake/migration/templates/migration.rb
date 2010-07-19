# If you need to migrate more than one element at once you can add them as arguments before the block.
# e.g. migration TITLE, GUID, Element1, Element2, Element3 do
migration "<%= title.gsub('_', ' ') %>", "<%= @migration_guid %>", <%= elements.join(', ') %> do
  description "Write your Migration Description here."

  up do
  end

  down do
  end		
end