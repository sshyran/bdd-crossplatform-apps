 # 
 # The MIT License (MIT)
 # 
 # Copyright (c) 2015 ustwo™
 # 
 # Permission is hereby granted, free of charge, to any person obtaining a copy
 # of this software and associated documentation files (the "Software"), to deal
 # in the Software without restriction, including without limitation the rights
 # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 # copies of the Software, and to permit persons to whom the Software is
 # furnished to do so, subject to the following conditions:

 # The above copyright notice and this permission notice shall be included in all
 # copies or substantial portions of the Software.
 # 
 # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 # SOFTWARE.
 
require_relative 'commit_list_screen'

class IosCommitListScreen < CommitListScreen

	def get_commit index
		text = @driver.find_element(xpath: "//UIATableCell[#{index+1}]/UIAStaticText[1]").text
		date = @driver.find_element(xpath: "//UIATableCell[#{index+1}]/UIAStaticText[2]").text

		{text: text, date: date}
	end

	def ids
	    map = Hash.new

	    map[:commitlist_button_refresh] = 'commitlist_button_refresh'
	    map[:commitlist_list] = 'commitlist_list'
	    map[:commitlist_list_row] = 'commit_list_list_row'
	    map[:commitlist_list_row_label_author] = 'commitlist_list_row_label_author'
	    map[:commitlist_no_commits_indicator] = 'commitlist_no_commits_indicator'
	    map[:commitlist_title] = 'commitlist_title'
	    map[:commitlist_loading_indicator] = 'commit_list_loading_indicator'

	    map
	end

end
