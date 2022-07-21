package Controller;

import DAO.AlbumeDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Albume;
import DAOImpl.AlbumeDaoImpl;


public class AlbumeController extends HttpServlet {

	Albume album = new Albume();
	AlbumeDaoImpl albumDaoImpl = new AlbumeDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaAlbum") != null) {
			
			String nume = request.getParameter("nume");
			String tip = request.getParameter("tip");
			
			album.setNume(nume);
			album.setTip(tip);
			if(nume != "" && tip!= "") {
				albumDaoImpl.adaugaAlbum(album);
				List<Albume> listaAlbume = new ArrayList();
				listaAlbume = albumDaoImpl.afiseazaAlbum();
				request.setAttribute("listaAlbume", listaAlbume);
				RequestDispatcher rd = request.getRequestDispatcher("tabela_Albume.jsp");
				rd.forward(request, response);
				}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Album.jsp");
			rd.forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaAlbum") != null) {
			List<Albume> listaAlbume = new ArrayList();
			listaAlbume = albumDaoImpl.afiseazaAlbum();
			request.setAttribute("listaAlbume", listaAlbume);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Albume.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaAlbum") != null) {
			long id1 = java.lang.Long.parseLong(request.getParameter("idalbum"));
			String nume = request.getParameter("nume");
			String tip = request.getParameter("tip");
			if(nume != "" && tip!= "") {
			albumDaoImpl.modificaAlbum(id1, nume, tip);
			List<Albume> listaAlbume = new ArrayList();
			listaAlbume = albumDaoImpl.afiseazaAlbum();
			request.setAttribute("listaAlbume", listaAlbume);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Albume.jsp");
			rd.forward(request, response);
			}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Album.jsp");
			rd.forward(request, response);
			}
		}

		if (request.getParameter("stergeAlbum") != null) {
			long id2 = Long.parseLong(request.getParameter("idalbum"));
			album.setIdalbum(id2);
			albumDaoImpl.stergeAlbum(album);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Album.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}