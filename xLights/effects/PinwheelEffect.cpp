#include "PinwheelEffect.h"
#include "PinwheelPanel.h"

#include "../sequencer/Effect.h"
#include "../RenderBuffer.h"
#include "../UtilClasses.h"

#include "../../include/pinwheel-16.xpm"
#include "../../include/pinwheel-24.xpm"
#include "../../include/pinwheel-32.xpm"
#include "../../include/pinwheel-48.xpm"
#include "../../include/pinwheel-64.xpm"

PinwheelEffect::PinwheelEffect(int id) : RenderableEffect(id, "Pinwheel", pinwheel_16, pinwheel_24, pinwheel_32, pinwheel_48, pinwheel_64)
{
    //ctor
}

PinwheelEffect::~PinwheelEffect()
{
    //dtor
}
wxPanel *PinwheelEffect::CreatePanel(wxWindow *parent) {
    return new PinwheelPanel(parent);
}

void PinwheelEffect::SetDefaultParameters(Model *cls) {
    PinwheelPanel *pp = (PinwheelPanel*)panel;
    if (pp == nullptr) {
        return;
    }

    pp->BitmapButton_PinwheelXCVC->SetActive(false);
    pp->BitmapButton_PinwheelYCVC->SetActive(false);
    pp->BitmapButton_Pinwheel_ArmSizeVC->SetActive(false);
    pp->BitmapButton_Pinwheel_SpeedVC->SetActive(false);
    pp->BitmapButton_Pinwheel_ThicknessVC->SetActive(false);
    pp->BitmapButton_Pinwheel_TwistVC->SetActive(false);
    
    SetChoiceValue(pp->Choice_Pinwheel_3D, "none");

    SetSliderValue(pp->Slider_PinwheelXC, 0);
    SetSliderValue(pp->Slider_PinwheelYC, 0);
    SetSliderValue(pp->Slider_Pinwheel_Arms, 3);
    SetSliderValue(pp->Slider_Pinwheel_ArmSize, 100);
    SetSliderValue(pp->Slider_Pinwheel_Thickness, 0);
    SetSliderValue(pp->Slider_Pinwheel_Twist, 0);
    SetSliderValue(pp->Slider_Pinwheel_Speed, 10);

    SetCheckBoxValue(pp->CheckBox_Pinwheel_Rotation, true);
}

void PinwheelEffect::Render(Effect *effect, const SettingsMap &SettingsMap, RenderBuffer &buffer) {

    float oset = buffer.GetEffectTimeIntervalPosition();

    int pinwheel_arms = SettingsMap.GetInt("SLIDER_Pinwheel_Arms", 3);
    int pinwheel_twist = GetValueCurveInt("Pinwheel_Twist", 0, SettingsMap, oset);
    int pinwheel_thickness = GetValueCurveInt("Pinwheel_Thickness", 0, SettingsMap, oset);
    bool pinwheel_rotation = SettingsMap.GetBool("CHECKBOX_Pinwheel_Rotation");
    const std::string &pinwheel_3d = SettingsMap["CHOICE_Pinwheel_3D"];
    int xc_adj = GetValueCurveInt("PinwheelXC", 0, SettingsMap, oset);
    int yc_adj = GetValueCurveInt("PinwheelYC", 0, SettingsMap, oset);
    int pinwheel_armsize = GetValueCurveInt("Pinwheel_ArmSize", 100, SettingsMap, oset);
    int pspeed = GetValueCurveInt("Pinwheel_Speed", 10, SettingsMap, oset);

    int xc;
    float tmax;
    HSVValue hsv, hsv1;
    std::vector<size_t> colorarray;
    colorarray.resize(pinwheel_arms);
    for (int i = 0; i < pinwheel_arms; i++) { colorarray[i] = i%buffer.GetColorCount(); }

    xc = (int)(ceil(std::hypot(buffer.BufferWi, buffer.BufferHt) / 2));

    double pos = (buffer.curPeriod - buffer.curEffStartPer) * pspeed * buffer.frameTimeInMs / 50;

    xc_adj = xc_adj*buffer.BufferWi / 200;
    yc_adj = yc_adj*buffer.BufferHt / 200;
    int degrees_per_arm = 1;
    if (pinwheel_arms > 0) degrees_per_arm = 360 / pinwheel_arms;
    float armsize = (pinwheel_armsize / 100.0);
    int max_radius = xc * armsize;
    if (pinwheel_thickness == 0) pinwheel_thickness = 1;
    tmax = (pinwheel_thickness / 100.0)*degrees_per_arm;

    // Force single visible line in case width is narrower than visible
    float pi_180 = M_PI/180;
    for(int a=0; a<pinwheel_arms; a++)
    {
        int ColorIdx = a%pinwheel_arms;
        xlColor color;
        buffer.palette.GetHSV(colorarray[ColorIdx], hsv);
        color = xlColor(hsv);

        int angle = (a*degrees_per_arm) - 90 ;
        if (pinwheel_rotation == 1) // do we have CW rotation
        {
            angle = angle + pos;
        } else {
            angle = angle - pos;
        }
        int x,y, degrees_twist;
        for (float r=0; r<=max_radius; r+=0.5)
        {
            degrees_twist = (r/max_radius) * pinwheel_twist;
            x = floor((int)(r * buffer.cos((angle + degrees_twist) * pi_180)) + xc_adj + buffer.BufferWi / 2);
            y = floor((int)(r * buffer.sin((angle + degrees_twist) * pi_180)) + yc_adj + buffer.BufferHt / 2);
            buffer.SetPixel(x,y,color);
        }
    }

    // Draw actual pinwheel arms
    for (int x = 0; x < buffer.BufferWi; x++)
    {
        int x1 = x - xc_adj - (buffer.BufferWi / 2);
        for (int y = 0; y < buffer.BufferHt; y++)
        {
            int y1 = y - yc_adj - (buffer.BufferHt / 2);
            double r = std::hypot(x1, y1);
            if (r <= max_radius) {
                double degrees_twist = (r / max_radius)*pinwheel_twist;
                double theta = (std::atan2(x1, y1) * 180 / 3.14159) + degrees_twist - (tmax/2);
                if (pinwheel_rotation == 1) // do we have CW rotation
                {
                    theta = pos + theta;
                }
                else {
                    theta = pos - theta;
                }
                theta = theta + 180.0;
                int t2 = (int)theta%degrees_per_arm;
                if (t2 <= tmax) {
                    double round = (float)t2 / (float)tmax;
                    t2 = std::abs(t2 - (tmax/2)) * 2;
                    xlColor color;
                    int ColorIdx2 = ((int)((theta/degrees_per_arm)))%pinwheel_arms;
                    if (buffer.palette.IsSpatial(ColorIdx2))
                    {
                        buffer.palette.GetSpatialColor(ColorIdx2, xc_adj + buffer.BufferWi / 2, yc_adj + buffer.BufferHt / 2, x, y, round, max_radius, color);
                        hsv = color.asHSV();
                    }
                    else
                    {
                        buffer.palette.GetHSV(colorarray[ColorIdx2], hsv);
                    }
                    hsv1=hsv;
                    color = xlColor(hsv1);
                    if(pinwheel_3d=="3D")
                    {
                        if (buffer.allowAlpha) {
                            color.alpha = 255.0 * ((tmax - t2) / tmax);
                        }
                        else {
                            hsv1.value = hsv.value * ((tmax - t2) / tmax);
                            color = hsv1;
                        }
                    }
                    else if (pinwheel_3d == "3D Inverted")
                    {
                        if (buffer.allowAlpha) {
                            color.alpha = 255.0 * ((t2) / tmax);
                        }
                        else {
                            hsv1.value = hsv.value * ((t2) / tmax);
                            color = hsv1;
                        }
                    }
                    buffer.SetPixel(x, y, color);
                }
            }
        }
    }
}

