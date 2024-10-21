
#module /// パスワード制御命令 ///

#deffunc passwordmini int aglobal,int bglobal,int cglobal,int dglobal,int eglobal,int fglobal,int gglobal,int hglobal,int iglobal
	uekakikomi = 1 
	sitakakikomi = 0  
	if aglobal = 0 : uenodanmozi = 10 : else : uenodanmozi = aglobal
	if bglobal = 0 : sitanodanmozi = 5 : else : sitanodanmozi = bglobal 
	if cglobal = 0 : passwordlock = 0 : else : passwordlock = cglobal
	if dglobal = 0 : kasolx = 0 : else : kasolx = dglobal
	if eglobal = 0 : kasoly = 0 : else : kasoly = eglobal
	if fglobal = 0 : pkasolx = 0 : else : pkasolx = fglobal
	if gglobal = 0 : pkasoly = 100 : else : pkasoly = gglobal
	if hglobal = 0 : namefont = 30 : else : namefont = hglobal
	if iglobal = 0 : passwordfont = 30 : else : passwordfont = iglobal
	textmax = 26
	sdim textmozi,,textmax
	dim infultext,textmax
	dim infultext_stop,textmax
	dim infultextkey,textmax
	dim mozi_indicate,textmax
	textmozi(0) = "a" : textmozi(1) = "b" : textmozi(2) = "c" : textmozi(3) = "d" : textmozi(4) = "e" : textmozi(5) = "f" : textmozi(6) = "g" : textmozi(7) = "h" : textmozi(8) = "i" : textmozi(9) = "j"
	textmozi(10) = "k" : textmozi(11) = "l" : textmozi(12) = "m" : textmozi(13) = "n" : textmozi(14) = "o" : textmozi(15) = "p" : textmozi(16) = "q" : textmozi(17) = "r" : textmozi(18) = "s" : textmozi(19) = "t"
	textmozi(20) = "u" : textmozi(21) = "v" : textmozi(22) = "w" : textmozi(23) = "x" : textmozi(24) = "y" : textmozi(25) = "z"
	repeat 26
		infultextkey(cnt) = 65+cnt
	loop
	numbermax = 10
	sdim numbersuuzi,,numbermax
	dim infulnumber,numbermax
	dim infulnumber_stop,numbermax
	dim infulnumberkey,numbermax
	dim suuzi_indicate,numbermax
	numbersuuzi(0) = "0" : numbersuuzi(1) = "1" : numbersuuzi(2) = "2" : numbersuuzi(3) = "3" : numbersuuzi(4) = "4" : numbersuuzi(5) = "5" : numbersuuzi(6) = "6" : numbersuuzi(7) = "7" : numbersuuzi(8) = "8" : numbersuuzi(9) = "9" : numbersuuzi(10) = "●"
	repeat numbermax
		infulnumberkey(cnt) = 48+cnt
	loop
	dim uenodan,uenodanmozi
	dim textmozix,textmax,uenodanmozi
	dim textmoziy,textmax,uenodanmozi
	sdim countmozi,,uenodanmozi
	dim mozi_size,uenodanmozi
	repeat uenodanmozi
	countmozi(cnt) = ""
	loop
	dim sitanodan,sitanodanmozi
	dim numbersuuzix,numbermax,sitanodanmozi
	dim numbersuuziy,numbermax,sitanodanmozi
	sdim countsuuzi,,sitanodanmozi
	dim suuzi_size,sitanodanmozi
	repeat sitanodanmozi
	countsuuzi(cnt) = ""
	loop
return   

#deffunc passwordplay int aglobalmusic,int bglobalmusic
	passwordammplay = aglobalmusic : passwordbmmplay = bglobalmusic 
return

#deffunc password
	repeat textmax
	getkey infultext(cnt),infultextkey(cnt)
	loop
	repeat numbermax
	getkey infulnumber(cnt),infulnumberkey(cnt)
	loop
	getkey back,8
	getkey tab,9
	kasol_hyouziin = kasol_hyouziin+1
	if kasol_hyouziin = 1 : kasol_hyouzi = 0
	if kasol_hyouziin = 10 : kasol_hyouzi = 1
	if kasol_hyouziin = 20 : kasol_hyouziin = 0
	if kasol_hyouzi = 1 & uekakikomi = 1{
		pos kasolx,kasoly
		color 0,0,0 : font "MS明朝",namefont,1
		mes "|"}
	if kasol_hyouzi = 1 & sitakakikomi = 1{
		pos kasolx,kasoly
		color 0,0,0 : font "MS明朝",passwordfont,1
		mes "|"}
	if back = 1 & back_stop = 0{
		back_stop = 1
		if passwordbmmplay ! 0 : mmplay passwordbmmplay
		if uekakikomi = 1 : back_mozi_mozi = 1
		if sitakakikomi = 1 : back_mozi_suuzi = 1
	}
	if back ! 1 : back_stop = 0
if uekakikomi = 1{
	repeat textmax
	if infultext(cnt) = 1 & infultext_stop(cnt) = 0 & uenodan(uenodanmozi-1) = ""{
		if passwordammplay ! 0 : mmplay passwordammplay
		infultext_stop(cnt) = 1
		mozi_indicate(cnt) = 1
	}
	if infultext(cnt) ! 1 : infultext_stop(cnt) = 0
	loop
}
	if tab = 1 & tab_stop = 0 & uekakikomi = 1{
		if passwordammplay ! 0 : mmplay passwordammplay
		tab_stop = 1
		tab_mozi = 1
	}
	if tab ! 1 : tab_stop = 0
if sitakakikomi = 1{
	repeat numbermax
	if infulnumber(cnt) = 1 & infulnumber_stop(cnt) = 0 & sitanodan(sitanodanmozi-1) = ""{
		if passwordammplay ! 0 : mmplay passwordammplay
		infulnumber_stop(cnt) = 1
		suuzi_indicate(cnt) = 1
	}
	if infulnumber(cnt) ! 1 : infulnumber_stop(cnt) = 0
	loop
}
repeat textmax
	text_cnt = cnt
	repeat uenodanmozi
	if uekakikomi = 1{
		if mozi_indicate(text_cnt) = 1{
			if uenodan(cnt) = 0{
				countmozi(cnt) = textmozi(text_cnt)
				uenodan(cnt) = 1
				mozi_indicate(text_cnt) = 0
				textmozix(text_cnt,cnt) = kasolx-ginfo(26)-ginfo(26)
				textmoziy(text_cnt,cnt) = kasoly
				pos textmozix(text_cnt,cnt),textmoziy(text_cnt,cnt)
				color 0,0,0 : font "MS明朝",namefont,1
				mes textmozi(text_cnt)
				mozi_size(cnt) = ginfo_mesx
				kasolx = kasolx+mozi_size(cnt)
				}
			}
	}
	if textmozix(text_cnt,cnt) = kasolx-ginfo(26)-ginfo(26) & uekakikomi = 1{
		countmozi(cnt) = ""
		uenodan(cnt) = 0
		mozi_size(cnt) = 0
		textmozix(text_cnt,cnt) = 0
	}
	if back_mozi_mozi = 1 & countmozi(0) ! ""{
	repeat uenodanmozi
	if back_itido_mozi = 0 & mozi_size(uenodanmozi-1-cnt) > 0 : back_itido_mozi = 1 : kasolx = kasolx-mozi_size(uenodanmozi-1-cnt) : break
	loop
	}
	pos textmozix(text_cnt,cnt)+ginfo(26)+ginfo(26),textmoziy(text_cnt,cnt)
	color 0,0,0 : font "MS明朝",namefont,1
	mes textmozi(text_cnt)
	loop
loop
		back_mozi_mozi = 0
		back_itido_mozi = 0
	if tab_mozi = 1 & uekakikomi = 1{
		if uenodan(0) = 1{
			hyouzi_tab = 0
			tab_mozi = 0
			uekakikomi = 0
			sitakakikomi = 1
			uenodansaisyux = kasolx
			uenodansaisyuy = kasoly
			kasolx = pkasolx
			kasoly = pkasoly
		}else : tab_mozi = 0 : hyouzi_tab = 1 : hyouzi_suuzi = 0
	}
repeat numbermax
	number_cnt = cnt
	repeat sitanodanmozi
	if sitakakikomi = 1{
		if suuzi_indicate(number_cnt) = 1{
			if sitanodan(cnt) = 0{
				countsuuzi(cnt) = numbersuuzi(number_cnt)
				sitanodan(cnt) = 1
				suuzi_indicate(number_cnt) = 0
				numbersuuzix(number_cnt,cnt) = kasolx-ginfo(26)-ginfo(26)
				numbersuuziy(number_cnt,cnt) = kasoly
				pos numbersuuzix(number_cnt,cnt),numbersuuziy(number_cnt,cnt)
				color 0,0,0 : font "MS明朝",passwordfont,1
				if passwordlock = 1 : mes numbersuuzi(number_cnt) : else : mes numbersuuzi(10)     
				suuzi_size(cnt) = ginfo_mesx
				kasolx = kasolx+suuzi_size(cnt)
				}
			}
	}
	if numbersuuzix(number_cnt,cnt) = kasolx-ginfo(26)-ginfo(26) & sitakakikomi = 1{
		countsuuzi(cnt) = ""
		sitanodan(cnt) = 0
		suuzi_size(cnt) = 0
		numbersuuzix(number_cnt,cnt) = 0
	}
	if back_mozi_suuzi = 1{
	repeat sitanodanmozi
		if back_itido_suuzi = 0 & sitanodan(0) ! "" & suuzi_size(sitanodanmozi-1-cnt) > 0 : back_itido_suuzi = 1 : kasolx = kasolx-suuzi_size(sitanodanmozi-1-cnt) : break
		if back_itido_suuzi = 0 & sitanodan(0) = "" & suuzi_size(sitanodanmozi-1-cnt) = 0 : kasolx = uenodansaisyux : kasoly = uenodansaisyuy : uekakikomi = 1 : sitakakikomi = 0: break
	loop
	}
	pos numbersuuzix(number_cnt,cnt)+ginfo(26)+ginfo(26),numbersuuziy(number_cnt,cnt)
	color 0,0,0 : font "MS明朝",passwordfont,1
	if passwordlock = 1 : mes numbersuuzi(number_cnt) : else : mes numbersuuzi(10)
	loop
loop
		back_mozi_suuzi = 0
		back_itido_suuzi = 0
	dim mozi_indicate,textmax
	dim suuzi_indicate,numbermax
	if countmozi(0) = "" : PLAYERNAME = "" : PLAYER = ""
	repeat uenodanmozi
		if countmozi(uenodanmozi-1-cnt) ! "" & nameask = 0{
			repeat uenodanmozi-cnt
				if nameask = 0 : nameask = 1 : PLAYERNAME = "" : PLAYER = ""
				PLAYERNAME = PLAYERNAME+countmozi(cnt)
				PLAYER = PLAYER+countmozi(cnt)
			loop
			repeat sitanodanmozi
				PLAYERNAME = PLAYERNAME+countsuuzi(cnt)
			loop
		}		
	loop
	nameask = 0
return PLAYERNAME

#global


#module /// 中央書き

#deffunc cmes str string,int enter
	nowx = 0.0+ginfo(22) : nowy = 0.0+ginfo(23)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	pos ginfo(26)*2,ginfo(27)*2 : mes string
	pos 0.0+nowx-((0.0+ginfo_mesx)/2.0),0.0+nowy-((0.0+ginfo_mesy)/2.0) : color r,g,b
	if enter = 0 : mes string : else : if enter = 1 : mes string+"\n"
return

#global


#module /// 中央装飾書き

#deffunc cemes str string,int enter
	nowx = 0.0+ginfo(22) : nowy = 0.0+ginfo(23)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	pos ginfo(26)*2,ginfo(27)*2 : emes string
	pos 0.0+nowx-((0.0+ginfo_mesx)/2.0),0.0+nowy-((0.0+ginfo_mesy)/2.0) : color r,g,b
	if enter = 0 : mes string : else : if enter = 1 : emes string+"\n"
return

#global


#module /// 縦書き

#deffunc vfont str fontname,int fontsize,int fontstyle
	if fontname = "0" : name = "MS明朝" : else: name = fontname
	fontinitial = strmid(name,0,1) : if fontinitial = "@" : name = name : else : name = "@"+name
	if fontsize = 0 : size = 20 : else : size = fontsize
	if fontstyle = 0 : style = 0 : else : style = fontstyle
	font name,size,style
return

#deffunc vcon str string,int number
	memory = 1000 : p = 1 : m = -p
	if vconfirst = 0 : vconfirst = 1 : dim empty,memory : dim colorr,memory : dim colorg,memory : dim colorb,memory
	vfont str(name),int(size),int(style)
	act = ginfo(3) : empty(number) = ginfo(25)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	colorr(number) = ginfo(16) : colorg(number) = ginfo(17) : colorb(number) = ginfo(18)
	buffer empty(number),ginfo(10),ginfo(11)
	if colorr(number) = 255 : dr = m : else : dr = p
	if colorg(number) = 255 : dg = m : else : dg = p
	if colorb(number) = 255 : db = m : else : db = p
	color colorr(number)+dr,colorg(number)+dg,colorb(number)+db : boxf
	pos 0,size+5 : color r,g,b : font name,size,style : mes string
	pos ginfo(26)*2,ginfo(27)*2 : initial = string : initial = strmid(initial,0,2) : mes initial
	celdiv empty(number),,,ginfo_mesx,ginfo_mesy+size+5
	gsel act
return

#deffunc vmes int serial
	if vconfirst = 0 : dialog "error  :  vcon命令が確認できません",1," error" : end
	nowx = ginfo(22) : nowy = ginfo(23)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	if colorr(serial) = 255 : dr = m : else : dr = p
	if colorg(serial) = 255 : dg = m : else : dg = p
	if colorb(serial) = 255 : db = m : else : db = p
	pos nowx,nowy : color colorr(serial)+dr,colorg(serial)+dg,colorb(serial)+db : gmode 4,0,0,256
	celput empty(serial),0,,,(M_PI/2)
	pos nowx,nowy : color r,g,b
return

#global


#module /// 通し番号文字

#deffunc sfont str fontname,int fontsize,int fontstyle
	if fontname = "0" : name = "MS明朝" : else: name = fontname
	if fontsize = 0 : size = 20 : else : size = fontsize
	if fontstyle = 0 : style = 0 : else : style = fontstyle
	font name,size,style
return

#deffunc scon str string,int number
	memory = 1000 : p = 1 : m = -p
	if sconfirst = 0 : sconfirst = 1 : dim empty,memory : dim colorr,memory : dim colorg,memory : dim colorb,memory
	act = ginfo(3) : empty(number) = ginfo(25)
	sfont str(name),int(size),int(style)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	colorr(number) = ginfo(16) : colorg(number) = ginfo(17) : colorb(number) = ginfo(18)
	buffer empty(number),ginfo(10),ginfo(11)
	if colorr(number) = 255 : dr = m : else : dr = p
	if colorg(number) = 255 : dg = m : else : dg = p
	if colorb(number) = 255 : db = m : else : db = p
	color colorr(number)+dr,colorg(number)+dg,colorb(number)+db : boxf
	pos 0,0 : color r,g,b : font name,size,style : mes string
	gsel act
return

#deffunc smes int serial
	if sconfirst = 0 : dialog "error  :  scon命令が確認できません",1," error" : end
	nowx = ginfo(22) : nowy = ginfo(23)
	r = ginfo(16) : g = ginfo(17) : b = ginfo(18)
	if colorr(serial) = 255 : dr = m : else : dr = p
	if colorg(serial) = 255 : dg = m : else : dg = p
	if colorb(serial) = 255 : db = m : else : db = p
	pos nowx,nowy : color colorr(serial)+dr,colorg(serial)+dg,colorb(serial)+db : gmode 4,0,0,255
	celput empty(serial)
	pos nowx,nowy : color r,g,b
return

#global


#module /// 中央座標

#deffunc cpos str string,double percentx,double percenty
	nowx = 0.0+percentx : nowy = 0.0+percenty
	pos ginfo(26)*2,ginfo(27)*2 : mes string
	pos 0.0+nowx-((0.0+ginfo_mesx)/2.0),0.0+nowy-((0.0+ginfo_mesy)/2.0)
return

#global


#module /// 割合座標

#deffunc ppos double percentx,double percenty
	pos (0.0+ginfo(10))*percentx/100.0,(0.0+ginfo(11))*percenty/100.0
return

#global


#module /// 割合中央揃え座標

#deffunc sppos str string,double percentx,double percenty
	pos (0.0+ginfo(10))*percentx/100.0,(0.0+ginfo(11))*percenty/100.0
	nowx = 0.0+ginfo(22) : nowy = 0.0+ginfo(23)
	pos ginfo(26)*2,ginfo(27)*2 : mes string
	pos 0.0+nowx-((0.0+ginfo_mesx)/2.0),0.0+nowy-((0.0+ginfo_mesy)/2.0)
return 

#global


#module /// 起動からの経過時間取得

#uselib "winmm.dll"
#cfunc timegettime "timeGetTime"

#deffunc timeget
	time = timegettime()
return time

#global


#module /// 時間割増加

#defcfunc pertime double number,int serial,double ptime,double pup
	memory = 1000
	if first=0 : first = 1 : dim time,memory : dim cstop,memory
	cnumber = number : timeget : nowtime = stat
	if serial<0 : serial = 0
	if ptime<=0.0 : ctime = 1.0 : else : ctime = ptime
	if pup=0.0 : cup = 1.0 : else : cup = pup
	if cstop(serial)=0 : cstop(serial) = 1 : timeget : time(serial) = stat
	if (nowtime-time(serial))>=(ctime*1000) : time(serial) = nowtime : cnumber += cup
return cnumber

#deffunc pdel int serial
	if serial<0 : serial = 0
	if cstop(serial)=1 : cstop(serial) = 0
return

#global


#module /// タイプ文字

#deffunc tmes str string,int serial,double ptime
	memory = 1000 : stmemory = 1300 : longmemory = stmemory
	if serial<0 : serial = 0
	if ptime<=0.0 : ctime = 1.0 : else : ctime = ptime
	if first=0 : first = 1 : sdim ex,stmemory,memory : sdim word,stmemory,memory,longmemory : dim wordlen,memory : ddim aim,memory : dim cstop,memory : dim complete,memory
	if cstop(serial)=0{
		cstop(serial)=1 : ex(serial) = string : wordlen(serial) = (strlen(ex(serial))/2)+1
		repeat wordlen(serial)
			word(serial,cnt) = strmid(ex(serial),0,2*cnt)
		loop
	}else{
		if complete(serial)=0{
	 		typetime aim(serial),serial,ctime,1.0
	 		aim(serial) = refdval : focus = int(aim(serial))
	 		if focus>=wordlen(serial) : aim(serial) = 0.0+wordlen(serial)-1 : focus = wordlen(serial)-1 : complete(serial) = 1
	 	}
	 	mes word(serial,focus)+" "
	 }
return complete(serial)

#deffunc tdel int serial
	if serial<0 : serial = 0
	if cstop(serial)=1{
		cstop(serial) = 0 : ex(serial) = ""
		repeat wordlen(serial)
			word(serial,cnt) = ""
		loop
		wordlen(serial) = 0 : complete(serial) = 0 : aim(serial) = 0.0
	}
return

#global


#module /// 時間割増加(タイプ用)

#deffunc typetime double number,int serial,double ptime,double pup
	memory = 1000
	if first=0 : first = 1 : dim time,memory : dim cstop,memory
	cnumber = number : timeget : nowtime = stat
	if serial<0 : serial = 0
	if ptime<=0.0 : ctime = 1.0 : else : ctime = ptime
	if pup=0.0 : cup = 1.0 : else : cup = pup
	if cstop(serial)=0 : cstop(serial) = 1 : timeget : time(serial) = stat
	if (nowtime-time(serial))>=(ctime*1000) : time(serial) = nowtime : cnumber += cup
return cnumber

#global

#module /// 数列内の計算

#defcfunc detect str string
	trialnum = strlen(string) : trial = string : newstr = string : standnow = 0
	repeat trialnum
		if strmid(trial,cnt,1)=" "{
			standnow = cnt
			repeat trialnum-(standnow+1),standnow+1
				if strmid(trial,cnt,1)!" "{
					newstr = strmid(newstr,0,standnow+1-1)+strmid(trial,cnt,1)
					standnow++
				}
				spaceeli = 1
			loop
		}
		if spaceeli=1 : spaceeli = 0 : break
	loop
	
	if first=0 : first = 1 : strmemory = 1000 : memo = 0 : sdim mass,32,trialnum,strmemory : sdim memostr,1000,strmemory : dim standmemo,strmemory : dim wordmemo,strmemory : dim nowchosememo,strmemory : dim teckmemo,strmemory
	trialnum = strlen(newstr) : trial = newstr : standnow = 0 : wordnum = 0 : overk = 0 : dot = 0
	repeat trialnum
		if overk<=cnt{
			if strnumber(strmid(trial,cnt,1))=1{
				standnow = cnt
				if trialnum-(standnow+1)=0 : mass(memo,wordnum) = strmid(trial,-1,1) : wordnum++
				repeat  trialnum-(standnow+1),standnow+1
					if strnumber(strmid(trial,cnt,1))=0{
						if strmid(trial,cnt,1)="."{
							if dot = 0 : dot = 1 : else : dialog "数字に誤りがあります",,"error" : stop
						}else{
							mass(memo,wordnum) = strmid(trial,standnow,cnt-standnow) : wordnum++
							overk = cnt : dot = 0
							break
						}
					}
					if cnt>=trialnum-1 : mass(memo,wordnum) = strmid(trial,standnow,cnt-standnow+1) : wordnum++ : overk = cnt+1 : dot = 0 : break
				loop
			}else{
				if strmid(trial,cnt,1)="s"|strmid(trial,cnt,1)="c"|strmid(trial,cnt,1)="t"|strmid(trial,cnt,1)="p"|strmid(trial,cnt,1)="l"|strmid(trial,cnt,1)="^"|strmid(trial,cnt,1)="e"{
					if strmid(trial,cnt,4)="sin("{
						parent = 1 : nowchose = cnt+3 : teck = 0
						repeat trialnum-nowchose
							if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
							if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
							teck++
							if parent=0 : break
							if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
						loop
						memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
						ka = double(detect("("+strmid(trial,nowchose+1,teck)))
						kai = sin(ka)
						trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
						mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
					}else{
						if strmid(trial,cnt,4)="cos("{
							parent = 1 : nowchose = cnt+3 : teck = 0
							repeat trialnum-nowchose
								if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
								if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
								teck++
								if parent=0 : break
								if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
							loop
							memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
							ka = double(detect("("+strmid(trial,nowchose+1,teck)))
							kai = cos(ka)
							trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
							mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
						}else{
							if strmid(trial,cnt,4)="tan("{
								parent = 1 : nowchose = cnt+3 : teck = 0
								repeat trialnum-nowchose
									if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
									if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
									teck++
									if parent=0 : break
									if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
								loop
								memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
								ka = double(detect("("+strmid(trial,nowchose+1,teck)))
								kai = tan(ka)
								trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
								mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
							}else{
								if strmid(trial,cnt,4)="log("{
									parent = 1 : nowchose = cnt+3 : teck = 0
									repeat trialnum-nowchose
										if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
										if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
										teck++
										if parent=0 : break
										if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
									loop
									memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
									ka = double(detect("("+strmid(trial,nowchose+1,teck)))
									kai = logf(ka)
									trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
									mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
								}else{
									if strmid(trial,cnt,2)="^("{
										parent = 1 : nowchose = cnt+1 : teck = 0
										repeat trialnum-nowchose
											if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
											if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
											teck++
											if parent=0 : break
											if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
										loop
										memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
										ka = double(detect("("+strmid(trial,nowchose+1,teck)))
										kai = "^"+ka
										trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
										mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
									}else{
										if strmid(trial,cnt,2)="pi"{
											mass(memo,wordnum) = str(m_pi) : wordnum++ : overk = cnt+3-1
										}else{
											if strmid(trial,cnt,1)="e"{
												mass(memo,wordnum) = str(2.7182818284590452354) : wordnum++ : overk = cnt+2-1
											}else : dialog "該当するものがありません",,"error" : stop
										}
									}
								}
							}
						}
					}
				}else : mass(memo,wordnum) = strmid(trial,cnt,1) : wordnum++
			}
		}		
	loop

	sdim hand,32,wordnum : focush = 0 : sdim side,32,wordnum : focuss = 0
	repeat wordnum
		if mass(memo,cnt)="("{
			side(focuss) = mass(memo,cnt) : focuss++
		}else{
			if yen(mass(memo,cnt))>=1{
				if focuss=0{
					side(focuss) = mass(memo,cnt) : focuss++
				}else{
					if yen(side(focuss-1))>0 & obch(side(focuss-1))>=obch(mass(memo,cnt)){
						hand(focush) = side(focuss-1) : focush++
						side(focuss-1) = mass(memo,cnt)
					}else{
						side(focuss) = mass(memo,cnt) : focuss++
					}
				}
			}else{
				if mass(memo,cnt)=")"{
					repeat focuss
						if side(focuss-cnt-1)="("{
							backp = focuss-cnt-1 : focusss = focuss
							break
						}
						if cnt=focuss-1 : dialog "()が不足しています",,"error" : stop
					loop
					repeat 2
						chcnt = cnt
						repeat focusss-backp
							if chcnt=2-1 & cnt+backp=backp{
								side(backp) = "" : focuss--
							}else{
								if yen(side(cnt+backp))=2-chcnt{
									hand(focush) = side(cnt+backp) : focush++
									side(cnt+backp) = "" : focuss--
								}
							}
						loop
					loop
				}else{
					if strmid(mass(memo,cnt),0,1)="^"{
						hand(focush) = mass(memo,cnt) : focush++
					}else{
						if status(mass(memo,cnt))=1{
							hand(focush) = mass(memo,cnt) : focush++
						}
					}
				}
			}
		}
	loop
	repeat 2
		chcnt = cnt
		repeat focuss
			if yen(side(cnt))=2-chcnt{
				hand(focush) = side(cnt) : focush++
				side(cnt) = ""
			}
		loop
	loop

	sdim stock,focush : stocks = 0
	repeat focush
		if status(hand(cnt))=1{
			stock(stocks) = hand(cnt) : stocks++
		}else{
			if stocks=0 : dialog "先頭に演算子が含まれています",,"error" : stop
			if strmid(hand(cnt),0,1)="^"{
				k = strlen(hand(cnt))-1
				ka = double(strmid(hand(cnt),1,k))
				kai = double(stock(stocks-1))
				stock(stocks-1) = str(powf(kai,ka))
			}
			if stocks=1{
				if hand(cnt)="+" : stock(0) = str(double(stock(0)))
				if hand(cnt)="-" : stock(0) = str(-double(stock(0)))
				if hand(cnt)="*" : dialog "先頭に演算子が含まれています",,"error" : stop
				if hand(cnt)="/" : dialog "先頭に演算子が含まれています",,"error" : stop
			}
			if stocks>1{
				if hand(cnt)="+" : stock(stocks-2) = str(double(stock(stocks-2))+double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="-" : stock(stocks-2) = str(double(stock(stocks-2))-double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="*" : stock(stocks-2) = str(double(stock(stocks-2))*double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="/" : stock(stocks-2) = str(double(stock(stocks-2))/double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
			}
		}
	loop
	memo-- : if memo<0 : memo = 0 : first = 0
	answer = stock(0)
return double(answer)

#global


#module /// 関数内の計算

#defcfunc function str string,str mozi,double x
	trialnum = strlen(string) : trial = string : newstr = string : standnow = 0 : focusmozi = mozi : functionx = x
	repeat trialnum
		if strmid(trial,cnt,1)=" "{
			standnow = cnt
			repeat trialnum-(standnow+1),standnow+1
				if strmid(trial,cnt,1)!" "{
					newstr = strmid(newstr,0,standnow+1-1)+strmid(trial,cnt,1)
					standnow++
				}
				spaceeli = 1
			loop
		}
		if spaceeli=1 : spaceeli = 0 : break
	loop
	
	if first=0 : first = 1 : strmemory = 1000 : memo = 0 : sdim mass,32,trialnum,strmemory : sdim memostr,1000,strmemory : dim standmemo,strmemory : dim wordmemo,strmemory : dim nowchosememo,strmemory : dim teckmemo,strmemory
	trialnum = strlen(newstr) : trial = newstr : standnow = 0 : wordnum = 0 : overk = 0 : dot = 0
	repeat trialnum
		if overk<=cnt{
			if strnumber(strmid(trial,cnt,1))=1{
				standnow = cnt
				if trialnum-(standnow+1)=0 : mass(memo,wordnum) = strmid(trial,-1,1) : wordnum++
				repeat  trialnum-(standnow+1),standnow+1
					if strnumber(strmid(trial,cnt,1))=0{
						if strmid(trial,cnt,1)="."{
							if dot = 0 : dot = 1 : else : dialog "数字に誤りがあります",,"error" : stop
						}else{
							mass(memo,wordnum) = strmid(trial,standnow,cnt-standnow) : wordnum++
							overk = cnt : dot = 0
							break
						}
					}
					if cnt>=trialnum-1 : mass(memo,wordnum) = strmid(trial,standnow,cnt-standnow+1) : wordnum++ : overk = cnt+1 : dot = 0 : break
				loop
			}else{
				if strmid(trial,cnt,1)="s"|strmid(trial,cnt,1)="c"|strmid(trial,cnt,1)="t"|strmid(trial,cnt,1)="p"|strmid(trial,cnt,1)="l"|strmid(trial,cnt,1)="^"|strmid(trial,cnt,1)="e"|strmid(trial,cnt,1)=focusmozi{
					if strmid(trial,cnt,4)="sin("{
						parent = 1 : nowchose = cnt+3 : teck = 0
						repeat trialnum-nowchose
							if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
							if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
							teck++
							if parent=0 : break
							if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
						loop
						memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
						ka = double(function("("+strmid(trial,nowchose+1,teck),focusmozi,functionx))
						kai = sin(ka)
						trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
						mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
					}else{
						if strmid(trial,cnt,4)="cos("{
							parent = 1 : nowchose = cnt+3 : teck = 0
							repeat trialnum-nowchose
								if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
								if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
								teck++
								if parent=0 : break
								if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
							loop
							memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
							ka = double(function("("+strmid(trial,nowchose+1,teck),focusmozi,functionx))
							kai = cos(ka)
							trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
							mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
						}else{
							if strmid(trial,cnt,4)="tan("{
								parent = 1 : nowchose = cnt+3 : teck = 0
								repeat trialnum-nowchose
									if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
									if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
									teck++
									if parent=0 : break
									if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
								loop
								memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
								ka = double(function("("+strmid(trial,nowchose+1,teck),focusmozi,functionx))
								kai = tan(ka)
								trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
								mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
							}else{
								if strmid(trial,cnt,4)="log("{
									parent = 1 : nowchose = cnt+3 : teck = 0
									repeat trialnum-nowchose
										if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
										if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
										teck++
										if parent=0 : break
										if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
									loop
									memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
									ka = double(function("("+strmid(trial,nowchose+1,teck),focusmozi,functionx))
									kai = logf(ka)
									trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
									mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
								}else{
									if strmid(trial,cnt,2)="^("{
										parent = 1 : nowchose = cnt+1 : teck = 0
										repeat trialnum-nowchose
											if strmid(trial,cnt+nowchose+1,1)="(" : parent += 1
											if strmid(trial,cnt+nowchose+1,1)=")" : parent -= 1
											teck++
											if parent=0 : break
											if cnt=trialnum-nowchose-1 : dialog "()が不足しています",,"error" : stop
										loop
										memostr(memo) = trial : standmemo(memo) = standnow : wordmemo(memo) = wordnum : nowchosememo(memo) = nowchose : teckmemo(memo) = teck : memo++
										ka = double(function("("+strmid(trial,nowchose+1,teck),focusmozi,functionx))
										kai = "^"+ka
										trial = memostr(memo) : standnow = standmemo(memo) : wordnum = wordmemo(memo) : nowchose = nowchosememo(memo) : teck = teckmemo(memo)					
										mass(memo,wordnum) = str(kai) : wordnum++ : overk = nowchose+teck+1
									}else{
										if strmid(trial,cnt,2)="pi"{
											mass(memo,wordnum) = str(m_pi) : wordnum++ : overk = cnt+3-1
										}else{
											if strmid(trial,cnt,1)="e"{
												mass(memo,wordnum) = str(2.7182818284590452354) : wordnum++ : overk = cnt+2-1
											}else{
												if strmid(trial,cnt,1)=focusmozi{
													mass(memo,wordnum) = str(functionx) : wordnum++ : overk = cnt+2-1			
												}else : dialog "該当するものがありません",,"error" : stop
											}
										}
									}
								}
							}
						}
					}
				}else : mass(memo,wordnum) = strmid(trial,cnt,1) : wordnum++
			}
		}		
	loop

	sdim hand,32,wordnum : focush = 0 : sdim side,32,wordnum : focuss = 0
	repeat wordnum
		if mass(memo,cnt)="("{
			side(focuss) = mass(memo,cnt) : focuss++
		}else{
			if yen(mass(memo,cnt))>=1{
				if focuss=0{
					side(focuss) = mass(memo,cnt) : focuss++
				}else{
					if yen(side(focuss-1))>0 & obch(side(focuss-1))>=obch(mass(memo,cnt)){
						hand(focush) = side(focuss-1) : focush++
						side(focuss-1) = mass(memo,cnt)
					}else{
						side(focuss) = mass(memo,cnt) : focuss++
					}
				}
			}else{
				if mass(memo,cnt)=")"{
					repeat focuss
						if side(focuss-cnt-1)="("{
							backp = focuss-cnt-1 : focusss = focuss
							break
						}
						if cnt=focuss-1 : dialog "()が不足しています",,"error" : stop
					loop
					repeat 2
						chcnt = cnt
						repeat focusss-backp
							if chcnt=2-1 & cnt+backp=backp{
								side(backp) = "" : focuss--
							}else{
								if yen(side(cnt+backp))=2-chcnt{
									hand(focush) = side(cnt+backp) : focush++
									side(cnt+backp) = "" : focuss--
								}
							}
						loop
					loop
				}else{
					if strmid(mass(memo,cnt),0,1)="^"{
						hand(focush) = mass(memo,cnt) : focush++
					}else{
						if status(mass(memo,cnt))=1{
							hand(focush) = mass(memo,cnt) : focush++
						}
					}
				}
			}
		}
	loop
	repeat 2
		chcnt = cnt
		repeat focuss
			if yen(side(cnt))=2-chcnt{
				hand(focush) = side(cnt) : focush++
				side(cnt) = ""
			}
		loop
	loop

	sdim stock,focush : stocks = 0
	repeat focush
		if status(hand(cnt))=1{
			stock(stocks) = hand(cnt) : stocks++
		}else{
			if stocks=0 : dialog "先頭に演算子が含まれています",,"error" : stop
			if strmid(hand(cnt),0,1)="^"{
				k = strlen(hand(cnt))-1
				ka = double(strmid(hand(cnt),1,k))
				kai = double(stock(stocks-1))
				if kai<0{
					if ka=double(int(ka)){
						kai *= -1
						if ka\2=1 : henka = 1
					}
				}
				stock(stocks-1) = str(powf(kai,ka))
				if henka=1 : henka = 0 : kai *= -1 : stock(stocks-1) = str(powf(kai,ka))
			}
			if stocks=1{
				if hand(cnt)="+" : stock(0) = str(double(stock(0)))
				if hand(cnt)="-" : stock(0) = str(-double(stock(0)))
				if hand(cnt)="*" : dialog "先頭に演算子が含まれています",,"error" : stop
				if hand(cnt)="/" : dialog "先頭に演算子が含まれています",,"error" : stop
			}
			if stocks>1{
				if hand(cnt)="+" : stock(stocks-2) = str(double(stock(stocks-2))+double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="-" : stock(stocks-2) = str(double(stock(stocks-2))-double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="*" : stock(stocks-2) = str(double(stock(stocks-2))*double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
				if hand(cnt)="/" : stock(stocks-2) = str(double(stock(stocks-2))/double(stock(stocks-1))) : stock(stocks-1) = "" : stocks--
			}
		}
	loop
	memo-- : if memo<0 : memo = 0 : first = 0
	answer = stock(0)
return double(answer)

#global


#module ///演算記号確認

#defcfunc yen str string
	yenjudge = 0
	if string="+"{
		yenjudge = 1
	}else{
		if string="-"{
			yenjudge = 1
		}else{
			if string="*"{
				yenjudge = 2
			}else{
				if string="/"{
					yenjudge = 2
				}else{
					yenjudge = -1
				}
			}
		}
	}
return yenjudge

#defcfunc obch str string
	objudge = 0
	if string="+"{
		objudge = 1
	}else{
		if string="-"{
			objudge = 1
		}else{
			if string="*"{
				objudge = 2
			}else{
				if string="/"{
					objudge = 2
				}else{
					if string="("|")"{
						objudge = 3
					}else{
						objudge = -1
					}
				}
			}
		}
	}
return objudge

#global


#module /// 数列の式か演算の判定

#defcfunc strnumber str judgestrnumber
	judgenumberstr = 0
	repeat 10
		if judgestrnumber=""+cnt : judgenumberstr = 1
	loop
return judgenumberstr

#defcfunc status str string
	statusstr = string : statlong = strlen(statusstr) : dont = 0 : statusan = 0
	repeat statlong
		if strnumber(strmid(statusstr,cnt,1))=0{
			if cnt>0 & strmid(statusstr,cnt,1)="."{
				if dont=0 : dont = 1 : else : statusan = -1 : break
				if strmid(statusstr,-1,1)="." : statusan = -1 : break
			}else{
				if cnt=0 & strmid(statusstr,cnt,1)!"-" : statusan = -1 : break
			}
		}else : statusan = 1
	loop
return statusan

#global