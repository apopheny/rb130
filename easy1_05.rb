# Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.


def rot_13(arr)
  alphabet = ('a'..'z').to_a
  decrypt = arr.map do |name|
    name.chars.map do |letter|
      index = alphabet.index(letter.downcase)
      if !alphabet.include?(letter.downcase)
        " "
      else
      index <= 12 ? alphabet[index + 13] : alphabet[index - 13]
      end
    end.join.split.map(&:capitalize).join(' ')
  end
  puts decrypt
end

names = [
'Nqn Ybirynpr', 
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat', 
'Puneyrf Onoontr', 
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv', 
'Wbua Ngnanfbss', 
'Ybvf Unvog', 
'Pynhqr Funaaba', 
'Fgrir Wbof', 
'Ovyy Tngrf', 
'Gvz Orearef-Yrr', 
'Fgrir Jbmavnx', 
'Xbaenq Mhfr', 
'Fve Nagbal Ubner', 
'Zneiva Zvafxl', 
'Lhxvuveb Zngfhzbgb', 
'Unllvz Fybavzfxv', 
'Tregehqr Oynapu'
]

rot_13(names)
