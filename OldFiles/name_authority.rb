filemaker_doc = Nokogiri.XML(File.open('VHD-sample.xml')); nil
name_authority_doc = Nokogiri.XML(File.open('AuthorizedCreators.xml')); nil

# Get hash of :prints_number => "Author Name"
table = name_authority_doc.xpath("//ss:Workbook/ss:Worksheet/ss:Table"); nil
prints_authors_hash = Hash.new
table.xpath("//ss:Row").each {|row|
  prints_number = row.xpath("ss:Cell[1]/ss:Data/text()").text.gsub(/\t/, '').strip
  author_name =  row.xpath('ss:Cell[2]/ss:Data/text()').text.gsub(/\t/, '').strip

  if author_name !~ /no authorized*/ && prints_number =~ /prints[0-9]+/ && author_name != ''
    prints_authors_hash[prints_number] = author_name
  end
}

#
rows = filemaker_doc.xpath("//FMPXMLRESULT/RESULTSET/ROW"); nil
rows.each {|row|
  prints_number = row.xpath('COL[10]/DATA/text()').text
  author_node = row.xpath('COL[16]/DATA').first
 
  # search prints_authors_hash for the prints_number
  author_name = prints_authors_hash.values_at(prints_number).first

  puts "#{prints_number} - #{author_name}"
  author_node.content = author_name
}
File.open('new_filenmaker.xml', 'w') {|f| f.write(filemaker_doc.to_xml)}
