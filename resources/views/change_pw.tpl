<form action="{$SCRIPT_NAME}" id="change_pw_form" method="post">
    {$errormsg_changepw}
    <div class="box_static">
        <div class="box_top">
            <h1 >{$langstrings.login.change_pw_head}</h1>
        </div>
        <div class="box_middle">
            <div class="middle" style="padding:5px;">
                <div style="padding:5px;width:200px;float:left;">{$langstrings.login.old_pw}:</div>
                <div style="padding:5px;float:left">
                    <input type="password" name="old_pw" value="" id="old_pw" />
                </div>
                <div class="break"></div>
                <div style="padding:5px;width:200px;float:left;">{$langstrings.login.new_pw}:</div>
                <div style="padding:5px;float:left">
                    <input type="password" name="new_pw" value="" id="new_pw" />
                </div>
                <div class="break"></div>
                <div style="padding:5px;width:200px;float:left;">{$langstrings.login.new_pw_confirm}:</div>
                <div style="padding:5px;float:left">
                    <input type="password" name="new_pw_confirm" value="" id="new_pw_confirm" />
                </div>
                
                
                <input type="hidden" name="mode" value="change_pw" />
                <div class="break"></div>
                <input id="change_pw_submit" type="submit" value="{$langstrings.login.change_pw_head}" />
            </div>
            <div class="break">&nbsp;</div>
        </div>
    </div>
</form>
