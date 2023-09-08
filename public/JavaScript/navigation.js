init(document.getElementById("root"), true);

function init(root, recursive)
{
    for (var i=0; i<root.childNodes.length; i++)
    {
        // check für Opera und Netscape
        if (!isNaN(root.childNodes[i].id))
        {
            with(root.childNodes[i])
            {
                // Verzeichnisse mit Unterverzeichnissen kenntlich machen
                if (lastChild.childNodes.length > 0)
                {
                    firstChild.firstChild.setAttribute("src","images/webelemente/pfeil.gif"); 
                    // init Unterverzeichnisse 
                    if (recursive == true)
                    {
                        init(lastChild, recursive);
                    }
                }
                else
                {
                    firstChild.firstChild.setAttribute("src","images/webelemente/kreis.gif"); 
                }
                lastChild.style.display="none";
            }
        }
    }
}

function getRoot(Source)
{
    while(Source.parentNode.id != "root")
    {
        Source = Source.parentNode;
    }
    return Source;
}

function openDir(dir)
{
    with(dir)
    {
        lastChild.style.display="";
        firstChild.firstChild.setAttribute("src","images/webelemente/kreis.gif"); 
    }
}

function closeDir(dir)
{
    with(dir)
    {
        // Unterverzeichnisse ausblenden
        lastChild.style.display="none";

        // Falls Unterverzeichnisse existieren den Kreis in einen Pfeil ändern
        if (lastChild.childNodes.length > 0)
        {
            firstChild.firstChild.setAttribute("src","images/webelemente/pfeil.gif"); 
        }
    }
}

function trigger(Source)
{
    init(document.getElementById("root"), false);

    if (Source.parentNode.lastChild.style.display!="none") 
    {
        closeDir(Source.parentNode)
    }
    else
    {
        openDir(Source.parentNode);
    }
    
    openDir(getRoot(Source));
}