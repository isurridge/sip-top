<!DOCTYPE HTML>








<html>
<head>
    <meta charset="UTF-8">
    <title>Ext JS Kitchen Sink</title>  
     
     
      <!-- Ext -->
      
    <link rel="stylesheet" type="text/css" href="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/resources/css/ext-all.css" />
    <script type="text/javascript" src="http://extjs-public.googlecode.com/svn/tags/extjs-4.1.1a/release/ext-all.js"></script>
 
    
<script type="text/javascript">
    Ext.require(['*']);
    
    
    
    Ext.onReady(function(){



   var store = Ext.create('Ext.data.TreeStore', {
        root: {
            expanded: true
        },
        proxy: {
            type: 'ajax',
            url: '../skin/scripts/getJsonTree.json'
        }
    });
    
    // Go ahead and create the TreePanel now so that we can use it below
     var treePanel = Ext.create('Ext.tree.Panel', {
        id: 'tree-panel',
        title: 'Sample Layouts',
     //   region:'west',
        renderTo: 'west',
        split: true,
        height: 770,
        minSize: 150,
        rootVisible: false,
        autoScroll: true,
        store: store
    });
    
    // Assign the changeLayout function to be called on tree node click.
    treePanel.getSelectionModel().on('select', function(selModel, record) {
        if (record.get('leaf')) {
         //   Ext.getCmp('content-panel').layout.setActiveItem(record.getId() + '-panel');
       
        
        }
    });



















        // NOTE: This is an example showing simple state management. During development,
        // it is generally best to disable state management as dynamically-generated ids
        // can change across page loads, leading to unpredictable results.  The developer
        // should ensure that stable state ids are set for stateful components in real apps.
        Ext.state.Manager.setProvider(Ext.create('Ext.state.CookieProvider'));

        var viewport = Ext.create('Ext.Viewport', {
             layout: 'border',
             items:[{
                 region: 'west',
                 title: 'West',
                 split: true,
                 width: 200,
                 minWidth: 175,
                 maxWidth: 400,
                 collapsible: true,
                 margin: '35 0 5 5',
                 layout: 'border',
                 id: 'layout-browser',
                 region:'west',
                 border: false,
                 split:true,
                 margins: '2 0 5 5',
                 width: 275,
                 minSize: 100,
                 maxSize: 500,
                 items: [treePanel]
             
             },{
                 region: 'center',
                 margin: '35 5 5 0',
                 layout: 'column',
                 autoScroll: true,
                 defaultType: 'container',
                 items: [{
                     columnWidth: 1/3,
                     padding: '5 0 5 5',
                     items:[{
                         title: 'A Panel',
                         html: Ext.example.shortBogusMarkup
                     }]
                 },{
                     columnWidth: 1/3,
                     padding: '5 0 5 5',
                     items:[{
                         title: 'A Panel',
                         html: Ext.example.shortBogusMarkup
                     }]
                 
                 }]
             }]
         });
     });
    
/*
    // example of putting together a full-screen BorderLayout within a Viewport.
    Ext.create('Ext.Viewport', {
        layout: 'border',
        title: 'Ext Layout Browser',
        items: [{
            xtype: 'box',
            id: 'header',
            region: 'north',
            html: '<h1> Ext.Layout.Browser</h1>',
            height: 30
        },{
            layout: 'border',
            id: 'layout-browser',
            region:'west',
            border: false,
            split:true,
            margins: '2 0 5 5',
            width: 275,
            minSize: 100,
            maxSize: 500,
            items: [treePanel, detailsPanel]
        }, 
            contentPanel
        ],
        renderTo: Ext.getBody()
    });
 */   
    
    
    /*
    
    Ext.require([
                 'Ext.tip.QuickTipManager',
                 'Ext.container.Viewport',
                 'Ext.layout.*',
                 'Ext.form.Panel',
                 'Ext.form.Label',
                 'Ext.grid.*',
                 'Ext.data.*',
                 'Ext.tree.*',
                 'Ext.selection.*',
                 'Ext.tab.Panel',
                 'Ext.ux.layout.Center'  
             ]);

             //
             // This is the main layout definition.
             //
             Ext.onReady(function(){
              
                 Ext.tip.QuickTipManager.init();

                 // This is an inner body element within the Details panel created to provide a "slide in" effect
                 // on the panel body without affecting the body's box itself.  This element is created on
                 // initial use and cached in this var for subsequent access.
                 var detailEl;
                 
                 // Gets all layouts examples
                 var layoutExamples = [];
                 Ext.Object.each(getBasicLayouts(), function(name, example) {
                     layoutExamples.push(example);
                 });

                 
                 // This is the main content center region that will contain each example layout panel.
                 // It will be implemented as a CardLayout since it will contain multiple panels with
                 // only one being visible at any given time.

                 var contentPanel = {
                      id: 'content-panel',
                      region: 'center', // this is what makes this panel into a region within the containing layout
                      layout: 'card',
                      margins: '2 5 5 0',
                      activeItem: 0,
                      border: false,
                      items: layoutExamples
                 };
                  
                 var store = Ext.create('Ext.data.TreeStore', {
                     root: {
                         expanded: true
                     },
                     proxy: {
                         type: 'ajax',
                         url: '../skin/scripts/getJsonTree.json'
                     }
                 });
                 
                 // Go ahead and create the TreePanel now so that we can use it below
                  var treePanel = Ext.create('Ext.tree.Panel', {
                     id: 'tree-panel',
                     title: 'Sample Layouts',
                     region:'north',
                     split: true,
                     height: 360,
                     minSize: 150,
                     rootVisible: false,
                     autoScroll: true,
                     store: store
                 });
                 
                 // Assign the changeLayout function to be called on tree node click.
                 treePanel.getSelectionModel().on('select', function(selModel, record) {
                     if (record.get('leaf')) {
                         Ext.getCmp('content-panel').layout.setActiveItem(record.getId() + '-panel');
                          if (!detailEl) {
                             var bd = Ext.getCmp('details-panel').body;
                             bd.update('').setStyle('background','#fff');
                             detailEl = bd.createChild(); //create default empty div
                         }
                         detailEl.hide().update(Ext.getDom(record.getId() + '-details').innerHTML).slideIn('l', {stopAnimation:true,duration: 200});
                     }
                 });
                 
                 // This is the Details panel that contains the description for each example layout.
                 var detailsPanel = {
                     id: 'details-panel',
                     title: 'Details',
                     region: 'center',
                     bodyStyle: 'padding-bottom:15px;background:#eee;',
                     autoScroll: true,
                     html: '<p class="details-info">When you select a layout from the tree, additional details will display here.</p>'
                 };
              
                 // Finally, build the main layout once all the pieces are ready.  This is also a good
                 // example of putting together a full-screen BorderLayout within a Viewport.
                 Ext.create('Ext.Viewport', {
                     layout: 'border',
                     title: 'Ext Layout Browser',
                     items: [{
                         xtype: 'box',
                         id: 'header',
                         region: 'north',
                         html: '<h1> Ext.Layout.Browser</h1>',
                         height: 30
                     },{
                         layout: 'border',
                         id: 'layout-browser',
                         region:'west',
                         border: false,
                         split:true,
                         margins: '2 0 5 5',
                         width: 275,
                         minSize: 100,
                         maxSize: 500,
                         items: [treePanel, detailsPanel]
                     }, 
                         contentPanel
                     ],
                     renderTo: Ext.getBody()
                 });
             });
    
    
    
    
    
    
    
    
    
             function getBasicLayouts() {
            	    // This is a fake CardLayout navigation function.  A real implementation would
            	    // likely be more sophisticated, with logic to validate navigation flow.  It will
            	    // be assigned next as the handling function for the buttons in the CardLayout example.
            	    var cardNav = function(incr){
            	        var l = Ext.getCmp('card-wizard-panel').getLayout();
            	        var i = l.activeItem.id.split('card-')[1];
            	        var next = parseInt(i, 10) + incr;
            	        l.setActiveItem(next);
            	        Ext.getCmp('card-prev').setDisabled(next===0);
            	        Ext.getCmp('card-next').setDisabled(next===2);
            	    };
            	    return {
            	       
            	        // The default start page, also a simple example of a FitLayout.
            	        start: {
            	            id: 'start-panel',
            	            title: 'Start Page',
            	            layout: 'fit',
            	            bodyStyle: 'padding:25px',
            	            contentEl: 'start-div'  // pull existing content from the page
            	        },

            	       
            	        absolute: {
            	            id: 'absolute-panel',
            	            title: 'Absolute Layout',
            	            layout: 'absolute',
            	            defaults: {
            	                bodyStyle: 'padding:15px;',
            	                width: 200,
            	                height: 100,
            	                frame: true
            	            },
            	            items:[{
            	                title: 'Panel 1',
            	                x: 50,
            	                y: 50,
            	                html: 'Positioned at x:50, y:50'
            	            },{
            	                title: 'Panel 2',
            	                x: 125,
            	                y: 125,
            	                html: 'Positioned at x:125, y:125'
            	            }]
            	        },

            	     
            	        accordion: {
            	            id: 'accordion-panel',
            	            title: 'Accordion Layout',
            	            layout: 'accordion',
            	            bodyStyle: 'background-color:#DFE8F6',  // if all accordion panels are collapsed, this looks better in this layout
            	            defaults: {bodyStyle: 'padding:15px'},
            	            items: [{
            	                title: 'Introduction',
            	                tools: [{type:'gear'},{type:'refresh'}],
            	                html: '<p>Here is some accordion content.  Click on one of the other bars below for more.</p>'
            	            },{
            	                title: 'Basic Content',
            	                html: '<br /><br /><p>More content.  Open the third panel for a customized look and feel example.</p>',
            	                items: {
            	                    xtype: 'button',
            	                    text: 'Show Next Panel',
            	                    handler: function(){
            	                        Ext.getCmp('acc-custom').expand(true);
            	                    }
            	                }
            	            },{
            	                id: 'acc-custom',
            	                title: 'Custom Panel Look and Feel',
            	                cls: 'custom-accordion', // look in layout-browser.css to see the CSS rules for this class
            	                html: '<p>Here is an example of how easy it is to completely customize the look and feel of an individual panel simply by adding a CSS class in the config.</p>'
            	            }]
            	        },

            	        
            	        anchor: {
            	            id:'anchor-panel',
            	            title: 'Anchor Layout',
            	            layout:'anchor',
            	            defaults: {bodyStyle: 'padding:15px'},
            	            items: [{
            	                title: 'Panel 1',
            	                height: 100,
            	                anchor: '50%',
            	                html: '<p>Width = 50% of the container</p>'
            	            },{
            	                title: 'Panel 2',
            	                height: 100,
            	                anchor: '-100',
            	                html: '<p>Width = container width - 100 pixels</p>'
            	            },{
            	                title: 'Panel 3',
            	                anchor: '-10, -262',
            	                html: '<p>Width = container width - 10 pixels</p><p>Height = container height - 262 pixels</p>'
            	            }]
            	        },

            	        
            	        border: {
            	            id:'border-panel',
            	            title: 'Border Layout',
            	            layout: 'border',
            	            bodyBorder: false,
            	            defaults: {
            	                collapsible: true,
            	                split: true,
            	                animFloat: false,
            	                autoHide: false,
            	                useSplitTips: true,
            	                bodyStyle: 'padding:15px'
            	            },
            	            items: [{
            	                title: 'Footer',
            	                region: 'south',
            	                height: 150,
            	                minSize: 75,
            	                maxSize: 250,
            	                cmargins: '5 0 0 0',
            	                html: '<p>Footer content</p>'
            	            },{
            	                title: 'Navigation',
            	                region:'west',
            	                floatable: false,
            	                margins: '5 0 0 0',
            	                cmargins: '5 5 0 0',
            	                width: 175,
            	                minSize: 100,
            	                maxSize: 250,
            	                html: '<p>Secondary content like navigation links could go here</p>'
            	            },{
            	                title: 'Main Content',
            	                collapsible: false,
            	                region: 'center',
            	                margins: '5 0 0 0',
            	                html: '<h1>Main Page</h1><p>This is where the main content would go</p>'
            	            }]
            	        },

            	       
            	        // Note that the TabPanel component uses an internal CardLayout -- it is not
            	        // something you have to explicitly configure.  However, it is still a perfect
            	        // example of how this layout style can be used in a complex component.
            	        cardTabs: {
            	            xtype: 'tabpanel',
            	            id: 'card-tabs-panel',
            	            plain: true,  //remove the header border
            	            activeTab: 0,
            	            style: 'background-color:#dfe8f6; ',
            	            defaults: {bodyStyle: 'padding:15px'},
            	            items:[{
            	                title: 'Tab 1',
            	                html: 'This is tab 1 content.'
            	            },{
            	                title: 'Tab 2',
            	                html: 'This is tab 2 content.'
            	            },{
            	                title: 'Tab 3',
            	                html: 'This is tab 3 content.'
            	            }]
            	        },

            	       
            	        cardWizard: {
            	            id:'card-wizard-panel',
            	            title: 'Card Layout (Wizard)',
            	            layout:'card',
            	            activeItem: 0,
            	            bodyStyle: 'padding:15px',
            	            defaults: {border:false},
            	            bbar: ['->', {
            	                id: 'card-prev',
            	                text: '&laquo; Previous',
            	                handler: Ext.Function.bind(cardNav, this, [-1]),
            	                disabled: true
            	            },{
            	                id: 'card-next',
            	                text: 'Next &raquo;',
            	                handler: Ext.Function.bind(cardNav, this, [1])
            	            }],
            	            items: [{
            	                id: 'card-0',
            	                html: '<h1>Welcome to the Demo Wizard!</h1><p>Step 1 of 3</p><p>Please click the "Next" button to continue...</p>'
            	            },{
            	                id: 'card-1',
            	                html: '<p>Step 2 of 3</p><p>Almost there.  Please click the "Next" button to continue...</p>'
            	            },{
            	                id: 'card-2',
            	                html: '<h1>Congratulations!</h1><p>Step 3 of 3 - Complete</p>'
            	            }]
            	        },

            	        
            	        column: {
            	            id:'column-panel',
            	            title: 'Column Layout',
            	            layout: 'column',
            	            bodyStyle: 'padding:5px',
            	            defaults: {bodyStyle:'padding:15px'},
            	            items: [{
            	                title: 'Width = 0.25',
            	                columnWidth: 0.25,
            	                html: '<p>This is some short content.</p>'
            	            },{
            	                title: 'Width = 0.75',
            	                columnWidth: 0.75,
            	                html: '<p>This is some longer content.</p><p>This is some longer content.</p><p>This is some longer content.</p><p>This is some longer content.</p><p>This is some longer content.</p><p>This is some longer content.</p>'
            	            },{
            	                title: 'Width = 250px',
            	                width: 250,
            	                html: 'Not much here!'
            	            }]
            	        },

            	       
            	        fit: {
            	            id: 'fit-panel',
            	            title: 'Fit Layout',
            	            layout: 'fit',
            	            items: {
            	                title: 'Inner Panel',
            	                html: '<p>This panel is fit within its container.</p>',
            	                bodyStyle: 'padding:15px',
            	                border: false
            	            }
            	        },

            	        
            	        // NOTE: While you can create a basic Panel with layout:'form', practically
            	        // you should usually use a FormPanel to also get its form-specific functionality.
            	        // Note that the layout config is not required on FormPanels.
            	        form: {
            	            xtype: 'form', // since we are not using the default 'panel' xtype, we must specify it
            	            id: 'form-panel',
            	            labelWidth: 75,
            	            title: 'Form Layout',
            	            bodyStyle: 'padding:15px',
            	            width: 350,
            	            labelPad: 20,

            	            defaults: {
            	                width: 230,
            	                labelSeparator: '',
            	                msgTarget: 'side'
            	            },
            	            defaultType: 'textfield',
            	            items: [{
            	                    fieldLabel: 'First Name',
            	                    name: 'first',
            	                    allowBlank:false
            	                },{
            	                    fieldLabel: 'Last Name',
            	                    name: 'last'
            	                },{
            	                    fieldLabel: 'Company',
            	                    name: 'company'
            	                },{
            	                    fieldLabel: 'Email',
            	                    name: 'email',
            	                    vtype:'email'
            	                }
            	            ],
            	            buttons: [{text: 'Save'},{text: 'Cancel'}]
            	        },

            	       
            	        table: {
            	            id: 'table-panel',
            	            title: 'Table Layout',
            	            layout: {
            	                type: 'table',
            	                columns: 4
            	            },
            	            defaults: {
            	                bodyStyle:'padding:15px 20px'
            	            },
            	            items: [{
            	                title: 'Lots of Spanning',
            	                html: '<p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p>',
            	                rowspan: 3
            	            },{
            	                title: 'Basic Table Cell',
            	                html: '<p>Basic panel in a table cell.</p>',
            	                cellId: 'basic-cell',
            	                cellCls: 'custom-cls'
            	            },{
            	                html: '<p>Plain panel</p>'
            	            },{
            	                title: 'Another Cell',
            	                html: '<p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p><br /><p>Row spanning.</p>',
            	                width: 300,
            	                rowspan: 2
            	            },{
            	                html: 'Plain cell spanning two columns',
            	                colspan: 2
            	            },{
            	                title: 'More Column Spanning',
            	                html: '<p>Spanning three columns.</p>',
            	                colspan: 3
            	            },{
            	                title: 'Spanning All Columns',
            	                html: '<p>Spanning all columns.</p>',
            	                colspan: 4
            	            }]
            	        },


            	        /*
            	         * ================  VBoxLayout config  =======================
            	         */
            	         
            	         
            	         /*
            	        vbox: {
            	            id: 'vbox-panel',
            	            title: 'vBox Layout',
            	            layout: {
            	                type: 'vbox',
            	                pack: 'start',
            	                align: 'stretch'
            	            },
            	            defaults: {
            	                frame: true
            	            },
            	            items: [{
            	                title: 'Panel 1',
            	                flex: 1,
            	                html: 'flex : 1'
            	            }, {
            	                title: 'Panel 2',
            	                height: 100,
            	                html: 'height: 100'
            	            }, {
            	                title: 'Panel 3',
            	                flex: 2,
            	                html: 'flex : 2'
            	            }]
            	        },

            	        /*
            	         * ================  HBoxLayout config  =======================
            	         */
            	         
            	         /*
            	        hbox: {
            	            id: 'hbox-panel',
            	            title: 'hBox Layout',
            	            layout: {
            	                type: 'hbox',
            	                pack: 'start',
            	                align: 'stretch'
            	            },
            	            defaults: {
            	                frame: true
            	            },
            	            items: [{
            	                title: 'Panel 1',
            	                flex: 1,
            	                html: 'flex : 1'
            	            }, {
            	                title: 'Panel 2',
            	                width: 100,
            	                html: 'width : 100'
            	            }, {
            	                title: 'Panel 3',
            	                flex: 2,
            	                html: 'flex : 2'
            	            }]
            	        }
            	    };
            	}
    
    
    
    
    
    */
    
    
    
             /*
        
Ext.onReady(function() {

        Ext.QuickTips.init();




          var store = Ext.create('Ext.data.TreeStore', {
              proxy: {
                  type: 'ajax',
                  url: '../skin/scripts/getJsonTree.json'
              },
              sorters: [{
                  property: 'leaf',
                  direction: 'ASC'
              }, {
                  property: 'text',
                  direction: 'ASC'
              }]
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
                width: 300,
                minWidth: 175,
                maxWidth: 300,
                collapsible: true,
                animCollapse: true,
                margins: '0 0 0 5',
                items: [
           
                        //Ext.ux.tree.TreeGrid is no longer a Ux. You can simply use a tree.TreePanel

                 Ext.create('Ext.tree.Panel', {
                            store: store,
                            rootVisible: false,
                            useArrows: true,
                            frame: true,
                            title: 'List',
                            renderTo: Ext.getBody(),
                            width: 300,
                            height: 600,
                            dockedItems: [{
                                xtype: 'toolbar',
                                items: {
                                    text: 'Get checked nodes',
                                    handler: function(){
                                        var records = tree.getView().getChecked(),
                                            names = [];
                                        
                                        Ext.Array.each(records, function(rec){
                                            names.push(rec.get('text'));
                                        });
                                        
                                        Ext.MessageBox.show({
                                            title: 'Selected Nodes',
                                            msg: names.join('<br />'),
                                            icon: Ext.MessageBox.INFO
                                        });
                                    }
                                }
                            }]
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

        
        
        
        
        
});   
        
        
     */   
        
        
        
     Ext.example = function(){
    	    var msgCt;

    	    function createBox(t, s){
    	       // return ['<div class="msg">',
    	       //         '<div class="x-box-tl"><div class="x-box-tr"><div class="x-box-tc"></div></div></div>',
    	       //         '<div class="x-box-ml"><div class="x-box-mr"><div class="x-box-mc"><h3>', t, '</h3>', s, '</div></div></div>',
    	       //         '<div class="x-box-bl"><div class="x-box-br"><div class="x-box-bc"></div></div></div>',
    	       //         '</div>'].join('');
    	       return '<div class="msg"><h3>' + t + '</h3><p>' + s + '</p></div>';
    	    }
    	    return {
    	        msg : function(title, format){
    	            if(!msgCt){
    	                msgCt = Ext.DomHelper.insertFirst(document.body, {id:'msg-div'}, true);
    	            }
    	            var s = Ext.String.format.apply(String, Array.prototype.slice.call(arguments, 1));
    	            var m = Ext.DomHelper.append(msgCt, createBox(title, s), true);
    	            m.hide();
    	            m.slideIn('t').ghost("t", { delay: 1000, remove: true});
    	        },

    	        init : function(){
    	            if(!msgCt){
    	                // It's better to create the msg-div here in order to avoid re-layouts 
    	                // later that could interfere with the HtmlEditor and reset its iFrame.
    	                msgCt = Ext.DomHelper.insertFirst(document.body, {id:'msg-div'}, true);
    	            }
//    	            var t = Ext.get('exttheme');
//    	            if(!t){ // run locally?
//    	                return;
//    	            }
//    	            var theme = Cookies.get('exttheme') || 'aero';
//    	            if(theme){
//    	                t.dom.value = theme;
//    	                Ext.getBody().addClass('x-'+theme);
//    	            }
//    	            t.on('change', function(){
//    	                Cookies.set('exttheme', t.getValue());
//    	                setTimeout(function(){
//    	                    window.location.reload();
//    	                }, 250);
//    	            });
    	//
//    	            var lb = Ext.get('lib-bar');
//    	            if(lb){
//    	                lb.show();
//    	            }
    	        }
    	    };
    	}();


    	Ext.onReady(Ext.example.init, Ext.example);


    	Ext.example.shortBogusMarkup = '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, '+
    	    'sodales a, porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales '+
    	    'non, iaculis ac, lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet '+
    	    'tincidunt quam turpis vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla.</p>';

    	Ext.example.bogusMarkup = '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, '+
    	    'porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, '+
    	    'lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis '+
    	    'vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.<br/><br/>'+
    	    'Aliquam commodo ullamcorper erat. Nullam vel justo in neque porttitor laoreet. Aenean lacus dui, consequat eu, adipiscing '+
    	    'eget, nonummy non, nisi. Morbi nunc est, dignissim non, ornare sed, luctus eu, massa. Vivamus eget quam. Vivamus tincidunt '+
    	    'diam nec urna. Curabitur velit. Lorem ipsum dolor sit amet.</p>';


    	// old school cookie functions
    	var Cookies = {};
    	Cookies.set = function(name, value){
    	     var argv = arguments;
    	     var argc = arguments.length;
    	     var expires = (argc > 2) ? argv[2] : null;
    	     var path = (argc > 3) ? argv[3] : '/';
    	     var domain = (argc > 4) ? argv[4] : null;
    	     var secure = (argc > 5) ? argv[5] : false;
    	     document.cookie = name + "=" + escape (value) +
    	       ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
    	       ((path == null) ? "" : ("; path=" + path)) +
    	       ((domain == null) ? "" : ("; domain=" + domain)) +
    	       ((secure == true) ? "; secure" : "");
    	};

    	Cookies.get = function(name){
    		var arg = name + "=";
    		var alen = arg.length;
    		var clen = document.cookie.length;
    		var i = 0;
    		var j = 0;
    		while(i < clen){
    			j = i + alen;
    			if (document.cookie.substring(i, j) == arg)
    				return Cookies.getCookieVal(j);
    			i = document.cookie.indexOf(" ", i) + 1;
    			if(i == 0)
    				break;
    		}
    		return null;
    	};

    	Cookies.clear = function(name) {
    	  if(Cookies.get(name)){
    	    document.cookie = name + "=" +
    	    "; expires=Thu, 01-Jan-70 00:00:01 GMT";
    	  }
    	};

    	Cookies.getCookieVal = function(offset){
    	   var endstr = document.cookie.indexOf(";", offset);
    	   if(endstr == -1){
    	       endstr = document.cookie.length;
    	   }
    	   return unescape(document.cookie.substring(offset, endstr));
    	};

    </script>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


 


</head>
<body>
    <!-- use class="x-hide-display" to prevent a brief flicker of the content -->
    <div id="west" class="x-hide-display">
        <p>Hi. I'm the west panel.</p>
    </div>
    <div id="center" class="x-hide-display">
        <a id="hideit" href="#">Toggle the west region</a>
	</div>
    <div id="center2" class="x-hide-display">
        <a id="hideit" href="#">Toggle the west region</a>
	</div>
    <div id="center1" class="x-hide-display">
        <p><b>Done reading me? Close me by clicking the X in the top right corner.</b></p>
        		

 
    </div>
    <div id="south" class="x-hide-display">
        <p>south - generally for informational stuff, also could be for status bar</p>
    </div>
</body>
</html>