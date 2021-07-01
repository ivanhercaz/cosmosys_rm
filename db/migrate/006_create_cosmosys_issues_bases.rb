class CreateCosmosysIssuesBases < ActiveRecord::Migration[5.2]
	def up

		##### CREATE TABLES

		tracker_ids = []
		Tracker.all.each{|tr|
			tracker_ids << tr.id
		}

		csload = IssueCustomField.create!(:name => 'csWload', 
			:field_format => 'float', :description => 'Workload %',
			:is_for_all => true, :tracker_ids => tracker_ids)

		csoldcode = IssueCustomField.create!(:name => 'csOldCode', 
				:field_format => 'string', :description => "Old Code(s)",
				:is_for_all => true, :tracker_ids => tracker_ids)

	end

	def down
		tmp = ProjectCustomField.find_by_name('csPrefix')
		if (tmp != nil) then
			tmp.destroy
		end		
		tmp = IssueCustomField.find_by_name('csEstWD')
		if (tmp != nil) then
			tmp.destroy
		end
		drop_table :cosmosys_issue_bases
	end
end
