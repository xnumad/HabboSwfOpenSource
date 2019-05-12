package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.room.object.data.StringArrayStuffData;

    public class HabboweenEngravingView extends FriendFurniEngravingView 
    {
        public function HabboweenEngravingView(k:FriendFurniEngravingWidget, _arg_2:StringArrayStuffData)
        {
            super(k, _arg_2);
        }

        override protected function assetName():String
        {
            return "habboween_engraving_xml";
        }
    }
}
