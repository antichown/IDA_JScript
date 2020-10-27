
<pre>

--- Note this build is for IDA 7.0+ and uses IDASRVR2      ---
--- for IDA <= 6.9 or historic commits see RE_PLUGINS repo ---

Status: stable
Link:   http://sandsprite.com/tools.php?id=25

Installer (to register dependancies properly)
        http://sandsprite.com/CodeStuff/IDAJS_2_Setup.exe

----------------------------------------
</pre>

 <img src="https://raw.githubusercontent.com/dzzie/IDA_JScript/master/ida_js_w_duk_screenshot.png">

<pre>
This is a standalone interface to script IDA using Javascript 
through the IDASrvr2 IPC plugin. Any language can remote control the IDASrvr2
plugin. More details here: http://www.hexblog.com/?p=773

The installer will:
   register all dependancies
   register the idajs file extension 
   install the IDA plugins

Major features: 
   full debugger support through Duktape Javascript engine
        - single stepping
        - breakpoints
        - mouse over variable tool tips etc. 
   modern code editor using Scintinella
        - syntax highlighting,
        - intellisense
        - tool tip function prototypes 

IDA Jscript main UI runs as a standalone process for ease of development.

Most commonly used IDA API have been added but it is a big job.
New api are added as necessary. 
</pre>

<img src="https://raw.githubusercontent.com/dzzie/IDA_JScript/master/select_ida_server.png">

<pre>
When IDA_jscript first starts, it will enumerate active IDASrvr instances. If
only one IDA is open it will automatically connect to it. If there is more than
one it will prompt you to select which one to interact with. If launched from 
the IDA plugins menu it will auto connect to the proper instance. 

There are a couple wrapped functions available by default without a class
prefix. These are implemented in userlib.js which you can edit.

h(x)     convert x to hex 
alert(x) supports arrays and other types
t(x)     appends to the output textbox on main form.
d(x)     appends output to the debug message list

Built in objects w/intellisense include:
    ida.    main IDA object
    fso.    file system functions
    al.     address list dialog (click to navigate bookmarks)
    x64.    class for dealing with 64 bit numbers as strings and doing math on them
    app.    application object
    pb.     progress bar on main form
    list.   list box for debug messages
    remote. remote symbol resolution client see article:
            https://www.fireeye.com/blog/threat-research/2017/06/remote-symbol-resolution.html

You can explore the api through intellisense or view the *.js stubs in the ./COM/ sub directory.
I will eventually add an object browser.

IDA JS  also has some other misc tools built in since the transition to IDA7 wacked 17 years 
of my plugins. These are available on the extras menu. 

So far this includes
    address list
    import patch
    IDA Compare Exporter (dev mode only now)

CIDAScript.cls is the primary IDASrvr2 client reference implementation. 

Note: IDA and IDA_Jscript.exe must be run at the same privledge level to interact. 
in development you can run IDA as admin or Extras -> Disable UIPI (dev only)

Dependancies and Source Links:
-------------------------------------------------------------

IDAJS is all open source

duk4vb:       https://github.com/dzzie/duk4vb
scivb:        https://github.com/dzzie/scivb2
spSubclass:   https://github.com/dzzie/libs/tree/master/Subclass
vbdevKit:     https://github.com/dzzie/libs/tree/master/vbDevKit

dependancies:
   dukDbg.ocx      - Activex
   spSubclass.dll  - ActiveX 
   SCIVB2.ocx      - ActiveX 
   vbDevKit.dll    - ActiveX
   UTypes.dll      - C dll must be in same dir as exe
   Duk4VB.dll      - C dll must be in same dir as dukDbg.ocx
   SciLexer.dll    - C dll must be in same dir as SCIVBX.ocx
   IDASrvr2.dll    - IDA plugin for 32bit disasm (x64 binary)
   IDASrvr2_64.dll - IDA plugin for 64bit disasm (x64 binary)
   MSWINSCK.OCX    - from MS included in installer
   richtx32.ocx    - from MS included in installer
   vb6 runtimes    - from MS assumed already installed
   mscomctl.ocx    - from MS assumed already installed
   
Credits:
--------------------------------------------

* Duktape   
     http://duktape.org

* Scintilla by Neil Hodgson [neilh@scintilla.org] 
     http://www.scintilla.org/

* ScintillaVB by Stu Collier 
     http://www.ceditmx.com/software/scintilla-vb/

* CSubclass by Paul Canton [Paul_Caton@hotmail.com]

* Interface by David Zimmer 
    http://sandsprite.com

</pre>


