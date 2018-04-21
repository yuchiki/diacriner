def apply_rule(word, rule)
    word.gsub!(rule[0], &(->(_w) { rule[1] } if rule[1].is_a? String))
end

def change(rules, word)
    rules.each { |rule| apply_rule(word, rule) }
    word
end

def repl
    loop do
        print '>'
        input = STDIN.gets.strip
        puts change(conversion, input.dup)
    end
end

def conversion
    vowels = [
        [/I[Ee]/, 'Í'], [/ie/, 'í'], [/E[Ii]/, 'É'], [/ei/, 'é'], [/E[Ee]/, 'È'], [/ee/, 'è'],
        [/A[Ee]/, 'Ä'], [/ae/, 'ä'], [/U[Uu]/, 'Ú'], [/uu/, 'ú'], [/O[Uu]/, 'Ó'], [/ou/, 'ó'],
        [/A[Ww]/, 'Å'], [/aw/, 'å'],
        [/E[Rr]/, 'R̥'], [/er/, 'ṛ']
    ]
    consonants = [
        [/S[Hh]/, 'Š'], [/sh/, 'š'],
        [/Z[Hh]/, 'Ž'], [/zh/, 'ž'],
        [/C[Hh]/, 'Č'], [/ch/, 'č'],
        [/G[Hh]/, 'Ǧ'], [/gh/, 'ǧ'],
        [/T[Hh]/, 'Ŧ'], [/th/, 'ŧ'],
        [/D[Hh]/, 'Đ'], [/dh/, 'đ']
    ]
    vowels + consonants
end

holmes = <<~EOS
    TU xxxxxx xxxx shi iz awlweiz dhe wuuman.
    Ai haev seeldem herd him meenshen her ander eeni adher neim.
    In hiz aiz shi eklipsiz and predomineits dhe houl ov her seex.
    It waz not dhat hi feelt eeni emoushen akin tu lav for Airien Aedler.
    Awl emoushenz, and dhat wan particuularli, wer abhorrent to hiz could, presais bat admairabli baelanst maind.
    Hi waz, Ai teik it, dhe moust perfekt riezning and obzerving mashien dhat dhe werld haz sien,
    bat az a laver hi wud haev pleist himseelf in a fawls pozishen.
    Hi neever spouk ov dhe softer paeshenz, seiv widh a jaib and a snier.
    dhei wer admairable thingz for dhe obzerver—eekselent for drawing dhe veil fram meen's moutivz and aekshenz.
EOS

preamble = <<~EOS
    Wi dhe Pieple ov dhe Unaitid Steits, in Order tu form a mor perfekt Union, estaeblish Jastis, inshur domeestik Tranquiliti, provaid for dhe komen defeens, promout dhe gheeneral Welfeir, and seecuur dhe Blesingz ov Liberti tu awrseelvz and awr Posteriti, du ordein and establish dhis Konstituushen for dhe Unaitid Steits ov Ameerika.
EOS


# Taken from http://anglish.wikia.com/wiki/Aesop%27s_Tales/The_Town_Mouse_and_The_Shire_Mouse, 2018/Apr./21/ 17:46
# Anglish is 'purified' version of English. <s>Id est</s> That is, Anglish is made of English, but loan words are removed as much as possible.
# Some literatures are transcripted into Anglish by lovers of this intellectual play or experiment.
# I respect all these 'Anglicans' from the depth of my heart.

anglish = <<~EOS
    Dhe Taun Maus stuupt tu teik ap a mauthful hier and dheer, wail dhe geestmaen saet nawing on a hawlm. Aefter a wail dhe weel-tu-du wan aterd alaud; " Leet mi aesk yu, mai ould meit, hau caen yu lav dhe dulnes ov yur raf and boring laif? Yu ar niedier dhan a cherch maus. Wud yu raedher liv hier amangst dhe aents on dhis bliek autkrop or besaid a braitli lit wei fild widh folk, and greit hauziz widh fuud for dhe teiking? Teik my werd for it, hier yur laif iz ebing a wei moust reechidly. wan daz not liv foreever. Laif iz short, bat it iz a taim tu blossom. Sou kam widh mi and Ai sweir dhat yu wil liv of dhe faet ov dhe Laend."
EOS



# puts sample
puts change(conversion, holmes.dup)
puts ""
puts change(conversion, preamble)
puts ""
puts change(conversion, anglish)
repl
