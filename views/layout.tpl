<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="/static/style.css">
        <link rel="shortcut icon" type="image/x-icon" href="/static/favicon.ico">
        <title>{{title or 'A simple Polish vocabulary engine'}}</title>
        <!-- Load jquery -->
        <script src="/static/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $(document).keyup(function (event) {
                    // handle cursor keys
                    if (event.keyCode == 37) {
                        // focus retry
                        $("#retry").focus();
                    } else if (event.keyCode == 39) {
                        // focus next vocabulary
                        $("#next").focus();
                    }
                });
            }); 
        </script>
    </head>
    <body>
        <div id="header" class="center">
            <a href="/"><img src="/static/logo.png"></a>
            <h1>A simple Polish vocabulary engine</h1>
        </div>
        <div id="content">
            %include
        </div>
        <div id="footer">
            <a href="http://github.com/orschiro/Vokapol">Go offline</a> <a href="mailto:orschiro@googlemail.com">Contact</a> <a href="/version">Vokapol v0.2</a> <a href="http://github.com/orschiro/Vokapol">Source code</a>
        </div>
    </body>
</html>
