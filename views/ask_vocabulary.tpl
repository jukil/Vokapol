<h1>
{{vocabulary}}
</h1>
<div class="buttons">
    <form action="/{{setting}}" method="post">
        <input class="button big" id="user_input" name="user_input" type="text" autofocus required>
        <script>
            if (!("autofocus" in document.createElement("input"))) {
                document.getElementById("user_input").focus();
            }
        </script>
        <input class="hidden" name="vocabulary" value="{{vocabulary}}" type="text">
        <input class="hidden" name="solution" value="{{solution}}" type="text">
        <input class="button big active" type="submit" value="Check">
    </form>
    %if setting == 'pl-de':
        <a class="button active" href="/pl-de">PL - DE</a> <a class="button" href="/de-pl">DE - PL</a> <a class="button" href="/random">Random</a>
    %elif setting == 'de-pl':
        <a class="button" href="/pl-de">PL - DE</a> <a class="button active" href="/de-pl">DE - PL</a> <a class="button" href="/random">Random</a>
    %else:
        <a class="button" href="/pl-de">PL - DE</a> <a class="button" href="/de-pl">DE - PL</a> <a class="button active" href="/random">Random</a>
    %end
</div>
%rebase layout title=''