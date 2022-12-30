//
//  SpecificCorners .swift
//  KitchenNeed
//
//  Created by Bouchedoub Ramzi on 30/12/2022.
//

import SwiftUI

struct SpecificCorners: Shape {
   
    func path(in rect: CGRect)-> Path {
        let  path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft ,.topRight] , cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }

}

struct SpecificCorners_Previews: PreviewProvider {
    static var previews: some View {
        SpecificCorners()
            .previewLayout(.fixed(width: 420, height: 130))
            .padding()
    }
}
