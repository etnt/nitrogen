-module (downloads).
-include_lib ("nitrogen/include/wf.hrl").
-compile(export_all).

main() -> #template { file="./templates/grid.html" }.

title() -> "Downloads".

layout() -> 
    #container_12 { body=[
        #grid_12 { class=header, body=common:header(downloads) },
        #grid_clear {},

        #grid_10 { alpha=true, omega=true, prefix=1, suffix=1, class=headline, body=headline() },
        #grid_clear {},

        #grid_5 { prefix=1, alpha=true, body=left(), class=pad_right },
        #grid_5 { suffix=1, omega=true, body=right() },
        #grid_clear {},

        #grid_12 { body=common:footer() }
    ]}.

headline() -> "Downloads".

left() -> 
    [
        " 
        Select a link to the right to download the Nitrogen 2.0
        environment for your platform. Each download is a self-contained
        installation of Nitrogen that includes both Erlang and a web 
        server. (In other words, you don't need to have Erlang installed 
        to run this.)
        <p>
        You have a choice between three popular Erlang web servers:
        <p>
        <ul>
        <li>Mochiweb - Erlang HTTP server developed by Bob Ippolito/MochiMedia.</li>
        <li>Yaws - Erlang HTTP server developed by Claes \"Klacke\" Wikstrom.</li>
        <li>Inets - Lightweight HTTP server built into Erlang.
        </ul>
        <p>
        Either Mochiweb or Yaws is recommended for production
        use. Whichever one you choose is up to personal preference,
        but Inets is not recommended for running in production because
        it does not yet include content-caching/expiration headers, which
        can cause slow loadtimes.
        <p>
        These packages were generated from Nitrogen source code by running 
        <b>make package_inets</b>, <b>make package_mochiweb</b>, and
        <b>make package_yaws</b>.
        <p>
        Alternatively, if you plan on contributing to the Nitrogen
        source code, you can download the source tree from GitHub.

        " 
    ].


right() ->
    [
        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/documentation.png" }
            ]},
            #span { class=title, text="Nitrogen Documentation" },
            #link { class=link, url="/doc/index.html", text="View Online" },
            "Docs are also included in platform downloads."
        ]},

        #panel { class=clear },

        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/erlang_logo.png" }
            ]},
            #span { class=title, text="Source Code" },
            #link { url="http://github.com/rklophaus/nitrogen/tarball/v2.0.0", text="Download Nitrogen 2.0.0 source (.tar.gz)" },
            #link { url="http://github.com/rklophaus/nitrogen/tarball/master", text="Download Latest Code (.tar.gz)" },
            #link { url="http://github.com/rklophaus/nitrogen", text="Nitrogen repository on GitHub" },
            #link { url="http://github.com/vim/nitrogen_elements", text="Community Repository of Nitrogen Elements" }
        ]},

        #panel { class=clear },

        #p{},
        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/mac_logo.png" }
            ]},
            #span { class=title, text="Mac OSX 10.5+ Binaries" },
            #link { class=link, url="http://files.nitrogenproject.com.s3.amazonaws.com/mac/nitrogen-2.0.0-mochiweb.tar.gz", text="Nitrogen 2.0.0 for Mac OSX on Mochiweb" },
            #link { class=link, url="http://files.nitrogenproject.com.s3.amazonaws.com/mac/nitrogen-2.0.0-yaws.tar.gz", text="Nitrogen 2.0.0 for Mac OSX on Yaws" },
            #link { class=link, url="http://files.nitrogenproject.com.s3.amazonaws.com/mac/nitrogen-2.0.0-inets.tar.gz", text="Nitrogen 2.0.0 for Mac OSX on Inets" }
        ]},

        #panel { class=clear },

        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/linux_logo_gray.png" }
            ]},
            #span { class=title, text="Linux Binaries Coming Soon" },
            #span { class=link, text="Nitrogen 2.0.0 for Linux on Mochiweb" },
            #span { class=link, text="Nitrogen 2.0.0 for Linux on Yaws" },
            #span { class=link, text="Nitrogen 2.0.0 for Linux on Inets" }
        ]},

        #panel { class=clear },

        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/windows_logo_gray.png" }
            ]},
            #span { class=title, text="Windows Binaries Coming Soon" },
            #span { class=link, text="Nitrogen 2.0.0 for Windows on Mochiweb" },
            #span { class=link, text="Nitrogen 2.0.0 for Windows on Yaws" },
            #span { class=link, text="Nitrogen 2.0.0 for Windows on Inets" }
        ]},

        #panel { class=clear },

        #panel { class=platform, body=[
            #panel { class=logo, body=[
                #image { image="/images/downloads/erlang_logo.png" }
            ]},
            #span { class=title, text="Old Source Code" },
            #link { url="http://github.com/rklophaus/nitrogen/tarball/v1.0", text="Download Nitrogen 1.0 source (.tar.gz)" }
        ]}
    ].

