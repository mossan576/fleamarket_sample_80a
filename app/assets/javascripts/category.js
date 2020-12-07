// $(document).ready(function() {

//   // カテゴリーセレクトボックスのオプションを作成
//   function appendOption(category){
//     var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
//     return html;
//   }

//   // 子カテゴリーの表示作成
//   function appendChildrenBox(insertHTML){
//     var childSelectHtml = '';
//     childSelectHtml = `<div id="children_wrapper">
//                         <select class= 'sell-box__detail__choose--select', id= 'child_category' name="item[category_id]">
//                           <option value="---" data-category="---">---</option>
//                           ${insertHTML}
//                       </div>`;
//     $('#PullDownCategory').append(childSelectHtml);
//   }

//   // 孫カテゴリーの表示作成
//   function appendGrandchildrenBox(insertHTML){
//     var grandchildSelectHtml = '';
//     grandchildSelectHtml = `<div id="grandchildren_wrapper">
//                         <select class= 'sell-box__detail__choose--select', id= 'grandchild_category' name="item[category_id]">
//                           <option value="---" data-category="---">---</option>
//                           ${insertHTML}
//                       </div>`;
//     $('#PullDownCategory').append(grandchildSelectHtml);
//   }

//     $('#parent_category').on('change', function(){
//     // 変数"parentCategory"に、プルダウンで選択した値を代入
//     var parentCategory = document.getElementById('parent_category').value;
//     if(parentCategory != "---"){
//       $.ajax({
//         url: 'get_category_children',
//         type: 'GET',
//         data: { parent_name: parentCategory },
//         dataType: 'json'
//       })
//       .done(function(children){
//         $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
//         $('#grandchildren_wrapper').remove();
//         var insertHTML = '';
//         children.forEach(function(child){
//           insertHTML += appendOption(child);
//         });
//         appendChildrenBox(insertHTML);
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
//       $('#grandchildren_wrapper').remove();
//     }
//   });

//   // 子カテゴリー選択後のイベント
//   $('#PullDownCategory').on('change', '#child_category', function(){
//     // カテゴリーの子要素に紐づくIDを取得して、そのIDに紐づく孫要素を取得する。
//     // option:selected を指定する事で、プルダウンで選択したものの情報を取得できる事になる。
//     var childId = $('#child_category option:selected').data('category');
//     if (childId != "---"){
//       // 自身で作成したget_category_grandchildrenのルーティングへ飛ばす。その際、プルダウンで選択されている子要素のIDも渡す。
//       $.ajax({
//         url: 'get_category_grandchildren',
//         type: 'GET',
//         data: { child_id: childId },
//         dataType: 'json'
//       })
//       .done(function(grandchildren){
//         if (grandchildren.length != 0) {
//           $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
//           var insertHTML = '';
//           grandchildren.forEach(function(grandchild){
//             insertHTML += appendOption(grandchild);
//           });
//           appendGrandchildrenBox(insertHTML);
//         }
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#grandchildren_wrapper').remove();
//     }
//   });
// });
// // $(document).on('turbolinks:load', function(){
// //   $(function(){
// //     function appendOption(category){
// //       var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
// //       return html;
// //     }
// //     function appendChildrenBox(insertHTML){
// //       var childSelectHtml = '';
// //       childSelectHtml = `<div class='sell-box__detail__choose__added' id= 'children_wrapper'>
// //                           <div class='.sell-box__detail__choose1'>
// //                             <i class='fas fa-chevron-down sell-box__detail__choose--arrow-down'></i>
// //                             <select class="sell-box__detail__choose--select" id="child_category" name="item[category_id]">
// //                               <option value="---" data-category="---">---</option>
// //                               ${insertHTML}
// //                             <select>
// //                           </div>
// //                         </div>`;
// //       $('.sell-box__detail__choose').append(childSelectHtml);
// //     }

// //     function appendGrandchildrenBox(insertHTML){
// //       var grandchildSelectHtml = '';
// //       grandchildSelectHtml = `<div class='sell-box__detail__choose__added' id= 'grandchildren_wrapper'>
// //                                 <div class='sell-box__detail__choose2'>
// //                                   <i class='fas fa-chevron-down sell-box__detail__choose--arrow-down'></i>
// //                                   <select class="sell-box__detail__choose__box--select" id="grandchild_category" name="item[category_id]">
// //                                     <option value="---" data-category="---">---</option>
// //                                     ${insertHTML}
// //                                   </select>
// //                                 </div>
// //                               </div>`;
// //       $('.sell-box__detail__choose').append(grandchildSelectHtml);
// //     }

// //     $('#parent_category').on('change', function(){
// //       var parent_category_id = document.getElementById
// //       ('parent_category').value; 
// //       if (parent_category_id != "---"){ 
// //         $.ajax({
// //           url: '/items/category/get_category_children',
// //           type: 'GET',
// //           data: { parent_id: parent_category_id },
// //           dataType: 'json'
// //         })
// //         .done(function(children){
// //           $('#children_wrapper').remove(); 
// //           $('#grandchildren_wrapper').remove();
// //           var insertHTML = '';
// //           children.forEach(function(child){
// //             insertHTML += appendOption(child);
// //           });
// //           appendChildrenBox(insertHTML);
// //         })
// //         .fail(function(){
// //           alert('カテゴリー取得に失敗しました');
// //         })
// //       }else{
// //         $('#children_wrapper').remove(); 
// //         $('#grandchildren_wrapper').remove();
// //       }
// //     });

// //     $('.sell-box__detail__choose').on('change', '#child_category', function(){
// //       var child_category_id = $('#child_category option:selected').data('category');
// //       if (child_category_id != "---"){ 
// //         $.ajax({
// //           url: '/items/category/get_category_grandchildren',
// //           type: 'GET',
// //           data: { child_id: child_category_id },
// //           dataType: 'json'
// //         })
// //         .done(function(grandchildren){
// //           if (grandchildren.length != 0) {
// //             $('#grandchildren_wrapper').remove(); 
// //             var insertHTML = '';
// //             grandchildren.forEach(function(grandchild){
// //               insertHTML += appendOption(grandchild);
// //             });
// //             appendGrandchildrenBox(insertHTML);
// //           }
// //         })
// //         .fail(function(){
// //           alert('カテゴリー取得に失敗しました');
// //         })
// //       }else{
// //         $('#grandchildren_wrapper').remove();
// //       }
// //     });
// //   });
// // });