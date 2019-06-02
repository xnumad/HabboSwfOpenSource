//com.sulake.habbo.tablet.catalog.BonusItemView

package com.sulake.habbo.tablet.catalog{
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;

    public class BonusItemView extends LayoutGroup {

        private var _countLabel:Label;

        public function BonusItemView();

        public function set count(k:int):void;

        override public function dispose():void;


    }
}//package com.sulake.habbo.tablet.catalog

