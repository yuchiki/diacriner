def apply_rule(word, rule)
    word.gsub!(rule[0], &(->(_w) { rule[1] } if rule[1].is_a? String))
end

def change(rules, word)
    rules.each { |rule| apply_rule(word, rule) }
    word
end

def conversion
    vowels = [
        [/I[Ee]/, 'Í'], [/ie/, 'í'], [/E[Ii]/, 'É'], [/ei/, 'é'], [/E[Ee]/, 'È'], [/ee/, 'è'],
        [/A[Ee]/, 'Ä'], [/ae/, 'ä'], [/U[Uu]/, 'Ú'], [/uu/, 'ú'], [/O[Uu]/, 'Ó'], [/ou/, 'ó'],
        [/A[Oo]/, 'Ă'], [/ao/, 'ă'],
#        [/E[Rr]/, 'R̥'], [/er/, 'ṛ'], [/el/, 'ḷ'], [/em/, 'ṁ'], [/en/, 'ṅ']
    ]
    consonants = [
        [/S[Hh]/, 'Š'], [/sh/, 'š'],
        [/Z[Hh]/, 'Ž'], [/zh/, 'ž'],
        [/C[Hh]/, 'Č'], [/ch/, 'č'],
        [/G[Hh]/, 'Ǧ'], [/gh/, 'ǧ'],
        [/T[Hh]/, 'Ŧ'], [/th/, 'ŧ'],
        [/D[Hh]/, 'Đ'], [/dh/, 'đ']
    ]
    delimiter = [[/@/, '']]
    vowels + consonants + delimiter
end


def repl
    loop do
        print '>'
        input = STDIN.gets.strip
        puts change(conversion, input.dup)
    end
end


def fromStdin()
    puts(change(conversion, STDIN.gets.strip))
end


#fromStdin
puts(change(conversion, File.open(ARGV[0]).read))
