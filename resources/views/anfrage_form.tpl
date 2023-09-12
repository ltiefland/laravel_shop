<div class="inner">
    <div class="csc-mailform">
    <div style="padding:2%;">
        <h1>
            Sie wollen ein Ger&auml;t verkaufen?
        </h1>
        <p>
            Bitte f&uuml;llen Sie das folgende Formular aus.
        </p>
    </div>
    <form action="/anfrage_form.htm" enctype="multipart/form-data" method="post">
      <ol>
        <li class="csc-form-2 csc-form-element csc-form-element-header"><h3>Maschinendaten</h3></li>
        <li class="csc-form-3 csc-form-element csc-form-element-textline">
          <label for="field-3">Maschinentyp</label>
          <input id="field-3" name="tx_form[Maschinentyp]" type="text"/>
        </li>
        <li class="csc-form-4 csc-form-element csc-form-element-textline">
          <label for="field-4">Marke/Modell</label>
          <input id="field-4" name="tx_form[Marke_Modell]" type="text"/>
        </li>
        <li class="csc-form-5 csc-form-element csc-form-element-textline">
          <label for="field-5">Baujahr</label>
          <input id="field-5" name="tx_form[Baujahr]" type="text"/>
        </li>
        <li class="csc-form-6 csc-form-element csc-form-element-textline">
          <label for="field-6">Betriebsstunden</label>
          <input id="field-6" name="tx_form[Betriebsstunden]" type="text"/>
        </li>
        <li class="csc-form-7 csc-form-element csc-form-element-textline">
          <label for="field-7">Preisvorstellung ohne MwSt.</label>
          <input id="field-7" name="tx_form[Preisvorstellung]" type="text"/>
        </li>
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
        <li class="csc-form-14 csc-form-element csc-form-element-header"><h3>Kurze Beschreibung</h3></li>
        <li class="csc-form-15 csc-form-element csc-form-element-textarea">
          <label for="field-15">Zustand/Ausstattung</label>
          <textarea cols="40" id="field-15" name="tx_form[Beschreibung]" rows="5"></textarea>
        </li>
        <li class="csc-form-16 csc-form-element csc-form-element-fileupload">
          <label for="field-16">Bild 1 hochladen</label>
          <input id="field-16" name="document[]" type="file"/>
        </li>
        <li class="csc-form-17 csc-form-element csc-form-element-fileupload">
          <label for="field-17">Bild 2 hochladen</label>
          <input id="field-17" name="document[]" type="file"/>
        </li>
        <li class="csc-form-18 csc-form-element csc-form-element-fileupload">
          <label for="field-18">Bild 3 hochladen</label>
          <input id="field-18" name="document[]" type="file"/>
        </li>
        <li class="csc-form-19 csc-form-element csc-form-element-fileupload">
          <label for="field-19">Bild 4 hochladen</label>
          <input id="field-19" name="document[]" type="file"/>
        </li>
        <li class="csc-form-20 csc-form-element csc-form-element-fileupload">
          <label for="field-20">Bild 5 hochladen</label>
          <input id="field-20" name="document[]" type="file" />
        </li>
        <li class="csc-form-21 csc-form-element csc-form-element-submit">
            <input type="hidden" name="action" value="sendmail" />
          <input id="field-21" type="submit" value="Formular absenden"/>
        </li>
      </ol>
    </form>
    </div>
</div>