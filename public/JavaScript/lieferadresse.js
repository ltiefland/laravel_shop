function lieferadresse(obj)
{
    checkbox = obj;
    
    while (obj.tagName != "TR")
    {
        obj=obj.parentNode;
    }

    while (obj.nextSibling)
    {
        obj = obj.nextSibling
        if (obj.nodeType == 1)
        {
            if (checkbox.value=="true")
            {
                obj.style.display="";
            }
            else
            {
                obj.style.display="none";
            }
        }
    }
}