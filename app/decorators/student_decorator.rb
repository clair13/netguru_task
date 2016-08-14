class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  	notes = subject_item_notes.where(subject_item: subject_item)
  	if notes.count > 0
  		sum = 0
  		notes.each do |note|
  			sum += note.value.to_f
  		end
  	    avg = sum/notes.length
  	    '%.2f' % avg
  	else
  		"0.00"
    end
  end
end
