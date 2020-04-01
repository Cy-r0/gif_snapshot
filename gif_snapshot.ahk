; gif snapshot tool by Cy-r0 (Ciro Cursio) 01/04/20


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Include Gdip.ahk


PrintScreen::

    pToken := Gdip_Startup()
    counter := 0 
    delay := 150   ; any lower and it seems to skip frames and/or not finish in time

    SoundPlay, %A_ScriptDir%\sounds\startrecording.wav   ; this is not async
    SetTimer, TakeScreenshot, %delay%


TakeScreenshot:

    screen_w := A_ScreenWidth, screen_h := A_ScreenHeight

    ; IF RATIO IS 21:9 (21.5:9 ACTUALLY), CUT AWAY SIDE BARS
    ratio := screen_w / screen_h
    if (ratio > 2)
    {
        short_w := screen_w * 16 * 2 // 43
        offset := (screen_w - short_w) // 2
        snap := Gdip_BitmapFromScreen(offset . "|0|" . short_w . "|" . screen_h)
    }
    else
    {
        snap := Gdip_BitmapFromScreen("0|0|" . screen_w . "|" . screen_h)
    }

    ; TAKE SNAPSHOT AND DOWNSAMPLE IT
    w := Gdip_GetImageWidth(snap), h := Gdip_GetImageHeight(snap)
    new_w := 640, new_h := 360
    new_snap := Gdip_CreateBitmap(new_w, new_h)
    G := Gdip_GraphicsFromImage(new_snap)
    Gdip_DrawImage(G, snap, 0, 0, new_w, new_h, 0, 0, w, h)

    ; SAVE EACH SNAPSHOT TO TEMPORARY FOLDER
    padded_counter := SubStr("000" . counter, -3)
    IfNotExist, %A_ScriptDir%\temp_snaps
        FileCreateDir, %A_ScriptDir%\temp_snaps
    Gdip_SaveBitmapToFile(new_snap, A_ScriptDir "\temp_snaps\snap" padded_counter ".bmp")

    Gdip_DisposeImage(snap)
    Gdip_DisposeImage(new_snap)


    if (counter >= 7 * 1000 // delay)
    {
       	SetTimer, , Off
	magickdelay := delay // 10
        SoundPlay, %A_ScriptDir%\sounds\stoprecording.wav

        ; CREATE GIF
        IfNotExist, %A_ScriptDir%\gifs
            FileCreateDir, %A_ScriptDir%\gifs
        FormatTime, CurrentDateTime, , dd-MM-yy_HHmmss
        RunWait, %comspec% /c "magick convert -depth 5 -delay %magickdelay% temp_snaps/snap*.bmp gifs/%CurrentDateTime%.gif", , Hide

        ; EMPTY TEMPORARY DIR
        RunWait, %comspec% /c "del /Q temp_snaps", , Hide
        SoundPlay, %A_ScriptDir%\sounds\gifsaved.wav
        Gdip_Shutdown(pToken)
    }
    
    counter++

    return