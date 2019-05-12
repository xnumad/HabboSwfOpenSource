package com.sulake.habbo.friendbar
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.friendbar.data.HabboFriendBarData;
    import com.sulake.iid.IIDHabboFriendBarData;
    import com.sulake.habbo.friendbar.view.HabboFriendBarView;
    import com.sulake.iid.IIDHabboFriendBarView;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.iid.IIDHabboLandingView;
    import com.sulake.habbo.friendbar.talent.HabboTalent;
    import com.sulake.iid.IIDHabboTalent;
    import com.sulake.habbo.friendbar.popup.HabboEpicPopupView;
    import com.sulake.iid.IIDHabboEpicPopupView;
    import com.sulake.habbo.friendbar.groupforums.GroupForumController;
    import com.sulake.iid.IIDHabboGroupForumController;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.friendbar.view.IHabboFriendBarView;

    public class HabboFriendBar extends Component implements IHabboFriendBar 
    {
        public function HabboFriendBar(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            k.attachComponent(new HabboFriendBarData(k, 0, _arg_3), [new IIDHabboFriendBarData()]);
            k.attachComponent(new HabboFriendBarView(k, 0, _arg_3), [new IIDHabboFriendBarView()]);
            k.attachComponent(new HabboLandingView(k, 0, _arg_3), [new IIDHabboLandingView()]);
            k.attachComponent(new HabboTalent(k, 0, _arg_3), [new IIDHabboTalent()]);
            k.attachComponent(new HabboEpicPopupView(k, 0, _arg_3), [new IIDHabboEpicPopupView()]);
            k.attachComponent(new GroupForumController(k, 0, _arg_3), [new IIDHabboGroupForumController()]);
        }

        public function set visible(k:Boolean):void
        {
            var _local_2:IHabboFriendBarView = (queueInterface(new IIDHabboFriendBarView()) as IHabboFriendBarView);
            if (_local_2 != null)
            {
                _local_2.visible = k;
                _local_2.release(new IIDHabboFriendBarView());
            }
        }
    }
}
