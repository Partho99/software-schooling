/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.language = 'en';
	config.uiColor = '#ffffff';
	config.height = 500;
        config.width = '100%';
	config.toolbarCanCollapse = true;
};

//CKEDITOR.replace('editor1');
//$(document).ready(function(){
//
//   $("#myForm").validate({
//   ignore: [],
//  
//     rules:{
//     		firstname:{
//        	required:true
//        },
//    editor1: {
//       required: function(textarea) {
//       CKEDITOR.instances[textarea.id].updateElement();
//       var editorcontent = textarea.value.replace(/<[^>]*>/gi, '');
//       return editorcontent.length === 0;
//     }
//               }
//     },messages:{
//     		firstname:{
//        	required:"Enter first name"
//        }
//        
//     }
//   });
//   
//});