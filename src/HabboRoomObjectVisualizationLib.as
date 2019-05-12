package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomObjectVisualizationFactoryBootstrap;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import images.*;
    import binaryData.*;

    public class HabboRoomObjectVisualizationLib extends SimpleApplication 
    {
        public static var manifest:Class = _Str_13938;
        public static var pet_experience_bubble_png:Class = _Str_13988;
        public static var snowball_small_png:Class = _Str_15015;
        public static var snowball_small_shadow_png:Class = _Str_13424;
        public static var snowball_big_png:Class = _Str_13103;
        public static var snowball_splash_1:Class = HabboRoomObjectVisualizationLib_snowball_splash_1;
        public static var snowball_splash_2:Class = HabboRoomObjectVisualizationLib_snowball_splash_2;
        public static var snowball_splash_3:Class = HabboRoomObjectVisualizationLib_snowball_splash_3;
        public static var requiredClasses:Array = new Array(RoomObjectVisualizationFactoryBootstrap, IIDRoomObjectVisualizationFactory);
    }
}
