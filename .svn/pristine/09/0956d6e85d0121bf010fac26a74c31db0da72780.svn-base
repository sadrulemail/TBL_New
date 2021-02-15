// Insert Quick Text Plugings
// Created by: Ashik Iqbal
// Creation Date: 2015-06-25
// Last Modify Date: 2015-06-25


CKEDITOR.plugins.add('qresponse', {
    icons: 'qresponse',
    init: function (editor) {
        editor.addCommand('insertqresponse', {
            exec: function (editor) {
                var now = new Date();
                //alert('s');
                //editor.insertHtml('The current date and time is: <em>' + now.toString() + '</em>');

                insertQuickResponse();
            }
        });
        editor.ui.addButton('qresponse', {
            label: 'Insert Quick Response',
            command: 'insertqresponse',
            toolbar: 'insert'
        });
    }
});