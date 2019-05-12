package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.room.object.data.StringArrayStuffData;

    public class WildWestEngravingView extends FriendFurniEngravingView 
    {
        public function WildWestEngravingView(k:FriendFurniEngravingWidget, _arg_2:StringArrayStuffData)
        {
            super(k, _arg_2);
        }

        override protected function assetName():String
        {
            return "wildwest_engraving_xml";
        }
    }
}
