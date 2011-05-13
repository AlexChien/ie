class SortPagesDataset < Dataset::Base
  def load
    # TODO Investigate why inflectors are breaking here
    create_record :page, :one,
      :title  => 'One',
      :slug   => 'one',
      :breadcrumb => 'one',
      :position => 1
    
    create_record :page, :two,
      :title  => 'Two',
      :slug   => 'two',
      :breadcrumb => 'two',
      :position => 1,
      :parent => pages(:one)
      
    create_record :page, :three,
      :title  => 'Three',
      :slug   => 'three',
      :breadcrumb => 'three',
      :position => 2,
      :parent => pages(:one)
      
    create_record :page, :four,
      :title  => 'Four',
      :slug   => 'four',
      :breadcrumb => 'four',
      :position => 3,
      :parent => pages(:one)
  end
end
