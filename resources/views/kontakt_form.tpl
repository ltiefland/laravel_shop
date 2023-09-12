<div class="inner">
    <div class="csc-mailform">
    <div style="padding:2%;">
        <h1>
            Schreiben Sie uns!
        </h1>
        <p>
            Bitte f&uuml;llen Sie das folgende Formular aus.
        </p>
    </div>
    <form action="/anfrage_form.htm" enctype="multipart/form-data" method="post">
      <ol>
        <li class="csc-form-8 csc-form-element csc-form-element-header"><h3>Pers&ouml;nliche Daten</h3></li>

        <li class="csc-form-9 csc-form-element csc-form-element-textline">
          <label for="field-9">Name</label>
          <input id="field-9" name="tx_form[Name]" type="text"/>
        </li>
        <li class="csc-form-10 csc-form-element csc-form-element-textline">
          <label for="field-10">E-Mail</label>
          <input id="field-10" name="tx_form[E-Mail]" type="text"/>
        </li>
        <li class="csc-form-11 csc-form-element csc-form-element-textline">
          <label for="field-11">Telefon</label>
          <input id="field-11" name="tx_form[Telefon]" type="text"/>
        </li>
        <li class="csc-form-12 csc-form-element csc-form-element-textline">
          <label for="field-12">Firma</label>
          <input id="field-12" name="tx_form[Firma]" type="text"/>
        </li>
        <li class="csc-form-13 csc-form-element csc-form-element-textline">
          <label for="field-13">Adresse</label>
          <input id="field-13" name="tx_form[Adresse]" type="text"/>
        </li>
        <li class="csc-form-14 csc-form-element csc-form-element-header"><h3>Kommentar</h3></li>
        <li class="csc-form-15 csc-form-element csc-form-element-textarea">
          <label for="field-15">Ihre Anfrage</label>
          <textarea cols="40" id="field-15" name="tx_form[Beschreibung]" rows="5"></textarea>
        </li>

        <li class="csc-form-21 csc-form-element csc-form-element-submit">
            <input type="hidden" name="action" value="sendmail" />
          <input id="field-21" type="submit" value="Formular absenden"/>
        </li>
      </ol>
    </form>
    </div>
</div>