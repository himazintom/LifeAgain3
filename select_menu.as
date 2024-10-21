#module select_menu
#deffunc msmenu int win_no, int x, int y//make_select_menu
win(a)=win_no : sbarx(a)=x : sbary(a)=y//windows_no, select_barx
mozi(a)=leter
gsel win(a)
sbarsx(a)=ginfo_winx : sbarsy(a)=ginfo_winy//画面サイズを保存
gsel 0//元の画面に戻る
a+1
return

#deffunc smenufc int fc_r, int fc_g, int fc_b//select_menu_frame_color
	fcr=fc_r : fcg=fc_g : fcb=fc_b
	return

#deffunc ssmenu int key, int flame, int gmode4//show_select_menu//key:キーボード入力アリにするか//flame:外枠表示するか(0:する,1:しない)//gmode4:透明化するか(0:しない,1:する)
	gmode 0 : ga=ginfo_act
	if key=0{
	getkey left,37
	getkey up,38
	getkey right,39
	getkey down,40
	getkey enter,13
	getkey esc,27
	}
	if up=0 & right=0 & ga!-1 : upp=0//押しっぱ禁止
	if down=0 & left=0 & ga!-1 : downp=0//押しっぱ禁止
	if (up=1 | right=1) & upp=0 & 0<b & ga!-1 : b=b-1 : upp=1//上に移動
	if (down=1 | left=1) & downp=0 & b<a-1 & ga!-1 : b=b+1 : downp=1//下に移動
	repeat a
		getkey lclick,1
		if sbarx(cnt)<=mousex & mousex<=sbarx(cnt)+sbarsx(cnt) & sbary(cnt)<=mousey & mousey<=sbary(cnt)+sbarsy(cnt){
			b=cnt
			if lclick=1 & ga!-1 : lclickc=1//もしマウスの位置がボタン外だったら反応しないようにする
		}
		if cnt=b{
			if flame=0 : color fcr,fcg,fcb : boxf sbarx(cnt)-3,sbary(cnt)-3,sbarx(cnt)+sbarsx(cnt)+3,sbary(cnt)+sbarsy(cnt)+3
			if gmode4=1 : color 243,0,255 : gmode 4,,,255
			pos sbarx(cnt),sbary(cnt) : celput win(cnt)
		}
		if cnt!b{
			if gmode4=1 : color 243,0,255 : gmode 4,,,255
			pos sbarx(cnt),sbary(cnt) : celput win(cnt)
		}
	loop
	if ga!-1{
		if enter=1 | lclickc=1 : kaesu=b
		if enter=0 & lclickc=0 : kaesu=-1
		if esc=1 : kaesu=-2
	}
	lclickc=0
	;logmes kaesu
	
return kaesu

#deffunc smreset//slect_menu_resrt
repeat a
win(cnt)=0 : sbarx(cnt)=0 : sbary(cnt)=0//windows_no, select_barx
mozi(cnt)=""
loop
a=0 : b=0
return
#global

#module
////////////////画像サイズを変える//////////////
	#deffunc rspic int resize_win_no,double baixx ,double baiyy//resize_picture
			rwn=resize_win_no
			gsel rwn
			gx=ginfo_winx:gy=ginfo_winy//元の画像サイズ
			buffer 10002,baixx*gx,baiyy*gy//元の画像を〇倍したサイズで新しい画面を作る
			gzoom ginfo_winx,ginfo_winy,rwn,0,0,gx,gy//↑の画面に元の画像を〇倍したのを張る
			buffer rwn,baixx*gx,baiyy*gy//↑で作った画像を元のwin_noに張り付ける
			celput 10002
		return
#global
#module
////////////指定した画像の真ん中を中心として割合で配置////////////////
	#deffunc ccppos int ccppos_win_no, int ccppos_percentx, int ccppos_percenty//cel_center_percent_position
		cwn=ccppos_win_no : cpx=ccppos_percentx : cpy=ccppos_percenty
		ga=ginfo_act//元いたウィンドウ
		if ga=-1 : ga=0
		gsel cwn//画像の大きさを調べる
		gx=ginfo_winx : gy=ginfo_winy
		gsel ga//元いたウィンドウに戻る
		gx=gx/2 : gy=gy/2
		rgx=double(ginfo_winx*cpx/100) : rgy=double(ginfo_winy*cpy/100)//real_gx
		pos rgx-gx,rgy-gy
		return
#global
#module
	#defcfunc  ppos_x int ppos_percentx//画面をpercentであらわしたした時のx座標を求める//percent_positionx
		gx=double(ginfo_winx) : ppx=ppos_percentx
		return gx*ppx/100
	#defcfunc  ppos_y int ppos_percenty//画面をpercentであらわしたした時のx座標を求める//percent_positionx
		gy=double(ginfo_winy) : ppy=ppos_percenty
		return gy*ppy/100
#global
#module
	#defcfunc  ccppos_x int ccppos_win_no, int ccppos_percentx//画面をpercentで当たらわした時のx座標を求める//cel_center_percent_positionx
		ccwn=ccppos_win_no//元画像のID
		ga=ginfo_act//元いたウィンドウ
		if ga=-1 : ga=0
		gsel ccwn//画像の大きさを調べる
		gx=ginfo_winx/2
		gsel ga//元いたウィンドウに戻る
		rgx=double(ginfo_winx) : ccppx=ccppos_percentx//元の画面サイズと貼りたい位置の割合を代入
		return rgx*ccppx/100-gx//元
		
	#defcfunc  ccppos_y int ccppos_win_no, int ccppos_percenty//画面をpercentで当たらわした時のy座標を求める//cel_center_percent_positiony
		ccwn=ccppos_win_no//元画像のID
		ga=ginfo_act//元いたウィンドウ
		if ga=-1 : ga=0
		gsel ccwn//画像の大きさを調べる
		gx=ginfo_winx/2
		gsel ga//元いたウィンドウに戻る
		rgy=double(ginfo_winy) : ccppy=ccppos_percenty//元の画面サイズと貼りたい位置の割合を代入
		return rgy*ccppy/100-gx
#global

#module
#deffunc ggsquare int gm, int x1, int y1, int x2, int y2//単色をgmode付きで塗りつぶす
	a(0)=x1 : a(1)=x2 : a(2)=x2 : a(3)=x1 : b(0)=y1 : b(1)=y1 : b(2)=y2 : b(3)=y2
	gmode 3,,,gm
	gsquare -1,a,b
	return
#global

#module//四捨五入(整数値にして返す)
#defcfunc sisute5 var var1
	a=var1*10
	b=a\10
	if b<5 : c=int(var1)
	if b>=5 : c=int(var1)+1
	c=double(c)
	return c
#global

#module//繰り上げ(整数値にして返す)
#defcfunc kuriage double var1
	a=var1*10
	b=int(a)/10+1
	return b
#global

#module 
#deffunc ccircle int cx, int cy, int cx2, int cy2, int cdraw_mode//中心から円を描く
	a=cx : b=cx2 : c=cy : d=cy2
	if cx2<cx : a=cx2 : b=cx
	if cy2<cy : c=cy2 : d=cy
	circle a-(b-a)/2,c-(d-c)/2,b-(b-a)/2,d-(d-c)/2,cdraw_mode
return

#deffunc bboxf int bx, int by, int bx2, int by2, int bdraw_mode//中心から資格を描く
	a=bx : b=bx2 : c=by : d=by2
	if bx2<bx : a=bx2 : b=bx
	if by2<by : c=by2 : d=by
	if bdraw_mode=0{
		line a-(b-a)/2,c-(d-c)/2,b-(b-a)/2,c-(d-c)/2//上
		line b-(b-a)/2,c-(d-c)/2,b-(b-a)/2,d-(d-c)/2//右
		line b-(b-a)/2,d-(d-c)/2,a-(b-a)/2,d-(d-c)/2//下
		line a-(b-a)/2,d-(d-c)/2,a-(b-a)/2,c-(d-c)/2//左
	}
	if bdraw_mode=1 : boxf a-(b-a)/2,c-(d-c)/2,b-(b-a)/2,d-(d-c)/2
	return

#deffunc boxline int lbx, int lby, int lbx2, int lby2//boxfでの、外枠だけ描く
	a=lbx : b=lbx2 : c=lby : d=lby2
	if lbx2<lbx : a=lbx2 : b=lbx
	if lby2<lby : c=lby2 : d=lby
	line a,c,b,c : line b,c,b,d : line b,d,a,d : line a,d,a,c
	return
#global



#module//画像の二点を固定しカメラワークを変えるように見せる
#deffunc pic_tf int picnum,int point, int sposx, int sposy, double delposx, double delposy//picture_transform
before_picnum=ginfo_sel// : gwx=ginfo_winx : gwy=ginfo_winy
gsel picnum : gwx=double(ginfo_winx) : gwy=double(ginfo_winy)

if point=0{
	a=0,int(gwx),int(gwx),0 : //b=0,0+(delposy-0)/(gwx/delposx),delpoy+(gwy-delpoy)/(gwx/delposx),gwy
	b=0,int(delposy*(gwx/delposx)),int(delposy+(gwy-delposy)*(gwx/delposx)),int(gwy)

	c=0,int(gwx),int(gwx),0 : d=0,0,int(gwy),int(gwy)
	
	y1=int(delposy*(gwx/delposx)) : y2=int(delposy+(gwy-delposy)*(gwx/delposx))//右端のy座標二点
	bai=gwy/abs(y2-y1)//倍率
	buffer 1000,gwx,gwy : gsquare picnum,a,b,c,d
	buffer 1001,gwx,gwy*bai : gzoom gwx,gwy*bai,1000,0,0,gwx,gwy
	gsel before_picnum : pos sposx,sposy : celput 1001
}
//title "y1="+int(delposy*(gwx/delposx))+"y2="+int(delposy+(gwy-delposy)*(gwx/delposx))
//logmes (double(gwx)/delposx)
return
#global

#module
#deffunc cpget int getcolorposx, int getcolorposy//grc(=ginfo_red_check)に各色情報を保存してくれる
	gcpx=a
	pget gcpx,gcpy
	grc=ginfo_r : rgc=ginfo_g : rbc=ginfo_b
	return
#global