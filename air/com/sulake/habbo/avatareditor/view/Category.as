//com.sulake.habbo.avatareditor.view.Category

package com.sulake.habbo.avatareditor.view{
    import feathers.controls.ImageLoader;
    import feathers.data.ListCollection;

    public class Category {

        public static const GENERIC:String;
        public static const HEAD:String;
        public static const TORSO:String;
        public static const LEGS:String;
        public static const WARDROBE:String;
        public static const HOT_LOOKS:String;
        public static const EFFECTS:String;

        private var _icon:ImageLoader;
        private var _id:String;
        private var _subCategories:ListCollection;
        private var _subCategoryIndex:int;
        private var _selectedIcon:ImageLoader;

        public function Category(k:String, _arg_2:String, _arg_3:ListCollection);

        public function dispose():void;

        public function get subCategories():ListCollection;

        public function get subCategoryIndex():int;

        public function set subCategoryIndex(k:int):void;

        public function get defaultIcon():ImageLoader;

        public function get defaultSelectedIcon():ImageLoader;

        public function get label():String;

        public function get id():String;


    }
}//package com.sulake.habbo.avatareditor.view

