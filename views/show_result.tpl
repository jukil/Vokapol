<h1 class="center">
{{result}}
</h1>
<div class="buttons center">
%if user_input == '':
    <form action="/{{setting}}" method="post">
    <input id="retry" name="retry" class="button big active" type="submit" value="Retry" autofocus>
    <script>
        if (!("autofocus" in document.createElement("input"))) {
            document.getElementById("retry").focus();
        }
    </script>
    <input class="hidden" name="vocabulary" type="text" value="{{vocabulary}}">
    <input class="hidden" name="solution" type="text" value="{{solution}}">
    </form>
%elif result != 'Correct':
    <form action="/{{setting}}" method="post">
    <input id="retry" name="retry" class="button big active" type="submit" value="Retry" autofocus>
    <script>
        if (!("autofocus" in document.createElement("input"))) {
            document.getElementById("retry").focus();
        }
    </script>
    <input class="hidden" name="vocabulary" type="text" value="{{vocabulary}}">
    <input class="hidden" name="solution" type="text" value="{{solution}}">
    <a href="/{{setting}}" id="next" class="button big">Next vocabulary</a>
    </form>
%else:
    <a href="/{{setting}}" id="next" class="button big active">Next vocabulary</a>
    <script>
        document.getElementById("next").focus();
    </script>
%end
</div>
%rebase layout title=''