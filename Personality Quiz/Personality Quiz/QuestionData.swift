//
//  QuestionData.swift
//  Personality Quiz
//
//  Created by Andrew Chen on 7/9/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import Foundation

struct Question
{
    var text: String
    var type: AnswerType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: SchoolType
}

enum AnswerType
{
    case single, multiple, ranged
}

enum SchoolType {
    case Viterbi, Marshall, Dornsife, SCA
    
    var description: String {
        if self == .Viterbi {
            return "You love solving problems and looking at life with an analytical approach. ."
        }
        else if self == .Marshall {
            return "You're very outgoing and networking is your passion. No, I don't want to add you on LinkedIn."
        }
        else if self == .Dornsife {
            return "You're highly passionate about your artsy and eclectic interests, despite their complete lack of real world application. I hope you're looking forward to graduate school!"
        }
        else {
            return "You're mysterious and no one knows what you actually do. Is watching a movie in class really that hard?"
        }
    }
}
