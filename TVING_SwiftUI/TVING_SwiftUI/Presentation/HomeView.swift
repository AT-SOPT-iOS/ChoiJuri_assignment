//
//  HomeView.swift
//  TVING_SwiftUI
//
//  Created by 최주리 on 5/28/25.
//

import SwiftUI

enum Category: String, CaseIterable {
    case home
    case drama
    case activity
    case movie
    case sports
    case news
    
    var title: String {
        switch self {
        case .home:
            "홈"
        case .drama:
            "드라마"
        case .activity:
            "예능"
        case .movie:
            "영화"
        case .sports:
            "스포츠"
        case .news:
            "뉴스"
        }
    }
}

struct HomeView: View {
    @Namespace private var segment
    @State private var selectedCategory: Category = .drama
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                segmentView
                Image(.mainMovie)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                todayView
                liveView
                baseballView
                categoryView
                dramaView
                footerView
            }
        }
        .background(.black)
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            Image(.mainLogo)
            
            Spacer()
            
            Image(.search)
            Image(.profile)
        }
    }
    
    private var segmentView: some View {
        HStack {
            ForEach(Category.allCases, id: \.self) { type in
                VStack(spacing: 0) {
                    Text(type.title)
                        .foregroundStyle(.white)
                        
                    Rectangle()
                        .fill(.white)
                        .frame(height: 3)
                        .isHidden(selectedCategory != type)
                        .matchedGeometryEffect(id: "underline", in: segment)
                        .padding(.top, 9)
                    
                }
                .onTapGesture {
                    print("type: \(type)")
                    withAnimation {
                        selectedCategory = type
                    }
                }
                .fixedSize()
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    private var todayView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("오늘의 티빙 TOP 20")
                .foregroundStyle(.white)
                .font(.system(size: 15, weight: .bold))
                .padding(12)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(TodayModel.mock(), id: \.self) { model in
                        todayCell(model)
                    }
                }
            }
            .contentMargins(.leading, 12)
        }
    }
    
    private var liveView: some View {
        VStack {
            HStack {
                Text("실시간 인기 LIVE")
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .bold))
                    .padding(12)
                
                Spacer()
                
                Text("더보기")
                    .foregroundStyle(.gray2)
                    .font(.system(size: 12))
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(LiveModel.mock(), id: \.self) { model in
                        liveCell(model)
                    }
                }
            }
        }
        .contentMargins(.leading, 12)
    }
    
    private var baseballView: some View {
        let array = ImageModel.baseballMock()
        
        return ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(array.indices, id: \.self) { index in
                    let model = array[index]
                    
                    ZStack {
                        Rectangle()
                            .fill(index % 2 == 0 ? .white : .black)
                        
                        Image(model.image)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
        .padding(.top, 25)
    }
    
    private var categoryView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(ImageModel.categoryMock(), id: \.self) { model in
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray4)
                        
                        Image(model.image)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 11)
                    }
                }
            }
        }
        .contentMargins(.leading, 15)
        .padding(.top, 28)
        .padding(.bottom, 12)
    }
    
    private var dramaView: some View {
        VStack(alignment: .leading) {
            Text("인생작 TOP 5")
                .foregroundStyle(.white)
                .font(.system(size: 15, weight: .bold))
                .padding(12)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(ImageModel.dramaMock(), id: \.self) { model in
                        Image(model.image)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
    }
    
    private var footerView: some View {
        VStack {
            HStack {
                Text("공지")
                    .foregroundStyle(.gray2)
                    .font(.system(size: 11))
                
                Text("티빙 계정 공유 정책 추가 안내")
                    .foregroundStyle(.gray1)
                    .font(.system(size: 11))
                
                Spacer()
                
                // option shift 9 -> ·
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 17)
            .background(.gray4)
            .cornerRadius(12)
            .padding(.horizontal, 14)
            .padding(.vertical, 23)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("고객문의·이용약관·")
                        .foregroundStyle(.gray2)
                        .font(.system(size: 11))
                    Text("개인정보처리방침")
                        .foregroundStyle(.white)
                        .font(.system(size: 11))
                    Spacer()
                }
                Text("사업자정보·인재채용")
                    .foregroundStyle(.gray2)
                    .font(.system(size: 11))
                
                Spacer()
                    .frame(height: 100)
            }
            .padding(.horizontal, 20)
        }
    }
}

extension HomeView {
    private func todayCell(_ model: TodayModel) -> some View {
        return HStack(alignment: .bottom) {
            Text("\(model.rank)")
                .foregroundStyle(.white)
                .font(.system(size: 50, weight: .heavy))
                .italic()
            Image(model.image)
        }
    }
    
    private func liveCell(_ model: LiveModel) -> some View {
        VStack {
            Image(model.image)
            HStack(alignment: .top) {
                Text("\(model.rank)")
                    .foregroundStyle(.white)
                    .font(.system(size: 19, weight: .heavy))
                    .italic()
                
                VStack(alignment: .leading) {
                    Text(model.title)
                        .foregroundStyle(.white)
                        .font(.system(size: 10, weight: .bold))
                    Text(model.description)
                        .foregroundStyle(.gray2)
                        .font(.system(size: 10, weight: .medium))
                    Text(String(format: "%.1f", model.percentage) + "%")
                        .foregroundStyle(.gray2)
                        .font(.system(size: 10, weight: .medium))
                }
                Spacer()
            }
        }
        .padding(.trailing, 7)
    }
}

#Preview {
    HomeView()
}
