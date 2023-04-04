//
//  SoundSetting.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/04.
//

import SwiftUI
import AVKit

class SoundSetting: ObservableObject {
    //1. soundSetting의 단일 인스턴스를 만듬
        /// singleton ? :
        /*싱글 톤은 한 번만 생성 된 다음 사용해야하는 모든 곳에서 공유해야하는 객체입니다 */
    static let instance = SoundSetting()
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case C
        case D
        case E
        case F
        case G
        case A
        case B
        case C2
        
        var sound: String {
            switch self {
            case .C:
                return "FX_piano01"
            case .D:
                return "FX_piano03"
            case .E:
                return "FX_piano05"
            case .F:
                return "FX_piano06"
            case .G:
                return "FX_piano08"
            case .A:
                return "FX_piano10"
            case .B:
                return "FX_piano12"
            case .C2:
                return "FX_piano13"
            }
        }
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.sound, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            print("소리나야지")
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
        
    }
 
}
 
struct SoundEffectView: View {
    
    var soundSetting = SoundSetting()
    var body: some View {
        VStack {
            HStack{
                Button {
                    SoundSetting.instance.playSound(sound: .C)
                } label: {
                    imageViews2(imageName: "piano_black")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .D)
                } label: {
                    imageViews2(imageName: "piano_black")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .E)
                } label: {
                    imageViews2(imageName: "piano_black")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .F)
                } label: {
                    imageViews2(imageName: "piano_black")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .G)
                } label: {
                    imageViews2(imageName: "piano_black")
                }
            }
            HStack {
                Button {
                    SoundSetting.instance.playSound(sound: .C)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .D)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .E)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .F)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .G)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .A)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .B)
                } label: {
                    imageViews(imageName: "piano_white")
                }
                Button {
                    SoundSetting.instance.playSound(sound: .C2)
                } label: {
                    imageViews(imageName: "piano_white")
                }
            }
        }
        
    }
}

struct imageViews: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.size.width/10, height: 300)
    }
}

struct imageViews2: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.size.width/10, height: 150)
    }
}
