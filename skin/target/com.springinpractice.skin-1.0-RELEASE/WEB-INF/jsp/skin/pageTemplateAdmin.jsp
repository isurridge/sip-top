<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>Ext JS Kitchen Sink</title>  
     
     
      <!-- Ext -->
      
    <link rel="stylesheet" type="text/css" href="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/resources/css/ext-all.css" />
    <script type="text/javascript" src="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/ext-all.js"></script>
 
    
<script type="text/javascript">
    Ext.require(['*']);
    

        
Ext.onReady(function() {

        Ext.QuickTips.init();


  var store = Ext.create('Ext.data.TreeStore', {
            proxy: {
                type: 'ajax',
                url: 'getJsonTree.json',
                extraParams: {
                    isXml: true
                },
                reader: {
                    type: 'json',
                    root: 'nodes',
                    record: 'node'
                }
            },
            sorters: [{
                property: 'leaf',
                direction: 'ASC'
            },{
                property: 'text',
                direction: 'ASC'
            }],
            root: {
                text: 'Ext JS',
                id: 'src',
                expanded: true
            }
        });







        // NOTE: This is an example showing simple state management. During development,
        // it is generally best to disable state management as dynamically-generated ids
        // can change across page loads, leading to unpredictable results.  The developer
        // should ensure that stable state ids are set for stateful components in real apps.
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));

        var viewport = Ext.create('Ext.Viewport', {
            id: 'border-example',
            layout: 'border',
            items: [
            // create instance immediately
            Ext.create('Ext.Component', {
                region: 'north',
                height: 32, // give north and south regions a height
                autoEl: {
                    tag: 'div',
                    html:'<p>Meetings - Admin</p>'
                }
            }), {
                // lazily created panel (xtype:'panel' is default)
                region: 'south',
                contentEl: 'south',
                split: true,
                height: 100,
                minSize: 100,
                maxSize: 200,
                collapsible: true,
                collapsed: true,
                title: 'Status',
                margins: '0 0 0 0'
            }, 

            {
                region: 'west',
                stateId: 'navigation-panel',
                id: 'west-panel', // see Ext.getCmp() below
                title: 'Navigation',
                split: true,
                width: 200,
                minWidth: 175,
                maxWidth: 400,
                collapsible: true,
                animCollapse: true,
                margins: '0 0 0 5',
                items: [
           
		     // create the Tree
		    Ext.create('Ext.tree.Panel', {
		         store: store,
		         hideHeaders: true,
		         rootVisible: true,
		         viewConfig: {
		             plugins: [{
		                 ptype: 'treeviewdragdrop'
		             }]
		         },
		         height: 350,
		         width: 400,
		         title: 'Directory Listing',
		         renderTo: 'west',
		         collapsible: true
		              
		      })
	           ]
            }, 
            // in this instance the TabPanel is not wrapped by another panel
            // since no title is needed, this Panel is added directly
            // as a Container
            Ext.create('Ext.tab.Panel', {
                region: 'center', // a center region is ALWAYS required for border layout
                deferredRender: false,
                activeTab: 0,     // first tab initially active
                items: [{
                    contentEl: 'center1',
                    title: 'One',
                    closable: true,
                    autoScroll: true
                }, {
                    contentEl: 'center2',
                    title: 'Two',
                    closable: true,
                    autoScroll: true
                }]
            })
	]
        });
        // get a reference to the HTML element with id "hideit" and add a click listener to it
    
 /*    Ext.get("hideit").on('click', function(){
            // get a reference to the Panel that was created with id = 'west-panel'
            var w = Ext.getCmp('west-panel');
            // expand or collapse that Panel based on its collapsed property state
            w.collapsed ? w.expand() : w.collapse();
        });
 */
    });
    </script>
 <decorator:head />
</head>
<body>
    <!-- use class="x-hide-display" to prevent a brief flicker of the content -->
    <div id="west" class="x-hide-display">
        <p>Hi. I'm the west panel.</p>
    </div>
    <div id="center2" class="x-hide-display">
        <a id="hideit" href="#">Toggle the west region</a>
	</div>
    <div id="center1" class="x-hide-display">
        <p><b>Done reading me? Close me by clicking the X in the top right corner.</b></p>
        		<decorator:body /> 
    </div>
    <div id="props-panel" class="x-hide-display" style="width:200px;height:200px;overflow:hidden;">
    </div>
    <div id="south" class="x-hide-display">
        <p>south - generally for informational stuff, also could be for status bar</p>
    </div>
</body>
</html>