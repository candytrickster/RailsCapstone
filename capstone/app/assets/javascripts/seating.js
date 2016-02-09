//var c = new fabric.Canvas('tables');
//
//function create(type, name)
//{
//    var table;
//    console.log("init script file");
//    var text = new fabric.Text(name, {
//        fontSize: 40,
//        originX: 'center',
//        originY: 'center',
//        fill: '#fff',
//        fontFamily: 'Didact'
//    });
//    switch(type)
//    {
//        case "circle":
//            table = new fabric.Circle({
//                radius: 80, fill: '#AB1E3E', originX: 'center', originY: 'center'
//            });
//            break;
//        case "rec":
//            table = new fabric.Rect({
//                width: 300, height:150, fill: '#AB1E3E', originX: 'center', originY: 'center'
//            });
//            break;
//        case "head":
//            table = new fabric.Rect({
//                width: 300, height:150, fill: '#AB1E3E', originX: 'center', originY: 'center'
//            });
//            break;
//        default:
//            break;
//    }
//    var group = new fabric.Group([ table, text ], {
//        left: 150,
//        top: 100
//    });
//    c.add(group);
//}
////      fabric.Image.fromURL('../assets/logo.png', function(img) {
////        img.scale(0.5).set({
////          left: 150,
////          top: 150,
////          angle: 0
////        });
////        c.add(img).setActiveObject(img);
////
////      });
//
//c.on({
//    'object:moving': function(e) {
//        e.target.opacity = 0.5;
//    },
//    'object:modified': function(e) {
//        e.target.opacity = 1;
//        if(e.target.getLeft() <= 0)
//        {
//            e.target.set({
//                left: 0
//            });
//            e.target.setCoords();
//            c.renderAll();
//        }
//        if(e.target.getTop() <= 0)
//        {
//            e.target.set({
//                top: 0
//            });
//            e.target.setCoords();
//            c.renderAll();
//        }
//        if(e.target.getTop() >= c.height - (e.target.height/2))
//        {
//            e.target.set({
//                top: c.height - (e.target.height/2)
//            });
//            e.target.setCoords();
//            c.renderAll();
//        }
//        if(e.target.getLeft() >= c.width - (e.target.width/2))
//        {
//            e.target.set({
//                left: c.width - (e.target.width/2)
//            });
//            e.target.setCoords();
//            c.renderAll();
//        }
//    }
//});
