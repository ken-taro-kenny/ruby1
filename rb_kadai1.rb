require "csv"
memo_type = 0

until memo_type === 1||memo_type === 2 do
  puts "1(新規でメモを作成) 2(既存のメモを編集する)"
  memo_type = gets.to_i
  if memo_type === 1
    case_pattern = "新規作成"
  elsif memo_type === 2
    case_pattern = "編集"
  end
end

case case_pattern
when "新規作成"
  puts "内容を入力"
  input = gets.chomp
  puts "拡張子を除いたファイル名を入力"
  file_name = gets.chomp + ".csv"
  CSV.open(file_name,'w') do |csv|
    csv << [input]
  end
  puts "保存完了"

when "編集"
  error_flag = true
  while error_flag === true do
  begin
  puts "拡張子を除いたファイル名を入力"
  file_name = gets.chomp + ".csv"
  p CSV.read(file_name)
  error_flag = false
  rescue
  puts "対象のファイルが存在しません"
  end
  end
  
  puts  "編集する場合は1を入力"
  hensyu = gets.to_i
  if hensyu === 1
    puts "編集する内容を記入"
    input = gets.chomp
    CSV.open(file_name,'w') do |csv|
      csv << [input]
    end
  puts "編集完了"
  end

end