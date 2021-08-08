class CosmosysTracker < ActiveRecord::Base
  belongs_to :tracker
  
  before_create :init_attr

  @@paint_pref = {
    :relation_color => {
      'blocks' => 'red',
      'precedes' => 'blue',
      'relates' => 'green',
      'copied_to' => 'orange'
    },
    :issue_color => {
      'valid' => 'black',
      'invalid' => 'red',
      'own' => 'blue',
    },
    :issue_shape => 'Mrecord',
    :chapter_shape => 'note'
  }

  def paint_pref
    @@paint_pref
  end

  def init_attr
    
  end  
end
